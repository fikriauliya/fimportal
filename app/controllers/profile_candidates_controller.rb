class ProfileCandidatesController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :authenticate_user!, :only => [:new, :step1, :index, :edit_workshop]
  before_filter :check_submission_status!, :only => [:step2, :step3, :step4]
  
  def check_submission_status!
    @profile = current_user.profile_candidate
    if !@profile.nil? && (@profile.status == "SUBMITTED" || @profile.status == "MARKED")
      redirect_to profile_candidates_path, :notice => "Data Anda sudah kami terima. Terimakasih"
    end
  end
  
  def step1
    @user = User.new
    if user_signed_in?
      redirect_to step2_profile_candidates_path
    else
      session[:after_sign_in_path_for] = step2_profile_candidates_path
    end
  end
  
  def step2
    @profile = current_user.profile_candidate
    
    if @profile.nil?
      @profile = ProfileCandidate.new
    else
      @is_announcement_displayed = check_announcement(@profile)
    end

    respond_to do |format|
      format.html 
      format.json { render json: @profile }
    end
  end
  
  def step3
    @profile = current_user.profile_candidate
    if @profile.nil?
      redirect_to step2_profile_candidates_path, :alert => 'Mohon isi halaman ini terlebih dahulu'
    else
      if params[:uploaded]
        flash[:notice] = "Foto Anda sudah diupload. Jika tidak ingin menganti, silakan klik Next"
      else
        flash[:notice] = nil
      end
      @is_announcement_displayed = check_announcement(@profile)
      
      respond_to do |format|
        format.html 
        format.json { render json: @profile }
      end
    end
  end 
  
  def step4
    @profile = current_user.profile_candidate
    if @profile.nil? or !@profile.photo?
      redirect_to step3_profile_candidates_path, :alert => 'Mohon isi halaman ini terlebih dahulu'
    else
      if params[:uploaded]
        flash[:notice] = "Surat rekomendasi Anda sudah diupload. Jika tidak ingin mengganti, silakan klik Next"
      else
        flash[:notice] = nil
      end
      @is_announcement_displayed = check_announcement(@profile)
      
      respond_to do |format|
        format.html 
        format.json { render json: @profile }
      end
    end
  end
  
  def step5
    @profile = current_user.profile_candidate
    if @profile.nil? or !@profile.recommendation_letter?
      redirect_to step4_profile_candidates_path, :alert => 'Mohon isi halaman ini terlebih dahulu'
    else
      @is_announcement_displayed = check_announcement(@profile)
      
      respond_to do |format|
        format.html 
        format.json { render json: @profile }
      end
    end
  end
  
  def index
    @profiles = ProfileCandidate.submitted.paginate(:page => params[:page],:per_page => 20)
    if user_signed_in?
      @profile = ProfileCandidate.find_by_user_id(current_user.id)
    end
        
    (@latitudes, @longitudes) = get_profile_candidates_latitudes_longitudes
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  #redirect to step1
  def new
    redirect_to step1_profile_candidates_path
  end

  #step2 post
  def create
    if !current_user.profile_candidate.nil?
      redirect_to step3_profile_candidates_path
    else
      @profile = ProfileCandidate.new(params[:profile_candidate])
      @profile.user_id = current_user.id
      
      respond_to do |format|
        if @profile.save
          format.html { redirect_to step3_profile_candidates_path }
          format.json { render json: @profile, status: :created, location: @profile }
        else
          format.html { render action: "step2" }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  #step2 put
  def update
    @profile = current_user.profile_candidate
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile_candidate])
        format.html { redirect_to step3_profile_candidates_path, notice: 'Data Anda telah diupdate' }
        format.json { head :no_content }
      else
        format.html { render action: "step2" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def upload_photo
    @profile = current_user.profile_candidate
    if !params[:profile_candidate].nil? && @profile.update_attribute(:photo, params[:profile_candidate][:photo])
      @success = true
      render "upload_photo_response", :layout => false
    else
      @success = false
      render "upload_photo_response", :layout => false
    end
  end
  
  def upload_recommendation_letter
    @profile = current_user.profile_candidate
    if !params[:profile_candidate].nil? && @profile.update_attribute(:recommendation_letter, params[:profile_candidate][:recommendation_letter])
      @success = true
      render "upload_recommendation_letter_response", :layout => false
    else
      @success = false
      render "upload_recommendation_letter_response", :layout => false
    end
  end
  
  def submit_confirmation
    @profile = current_user.profile_candidate
    if params[:confirmation] && params[:confirmation] == "1" && @profile.update_attributes({:status => 'SUBMITTED', :submitted_at => Time.now}, :as => :confirmation_step)
      Rails.cache.delete('profile_candidates_latitudes_longitudes')
      redirect_to profile_candidates_path, notice: 'Data Anda sudah kami terima. Terimakasih'
    else
      redirect_to step5_profile_candidates_path, :alert => 'Anda harus mencentang persetujuan di bawah'
    end
  end
  
  #only for updating biodata
  def update_biodata
    @profile = current_user.profile_candidate
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile_candidate], :as => :additional_fields)
        format.html { redirect_to profile_candidates_path, notice: 'Data Anda telah diupdate' }
        format.json { head :no_content }
      else
        format.html { redirect_to profile_candidates_path, alert: 'Data Anda tidak valid. Pastikan jumlah karakter tidak melebihi 160 karakter' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit_workshop
    if user_signed_in?
      @profile = current_user.profile_candidate
      logger.info @profile.workshop
      if !@profile.is_update_allowed
        redirect_to root_path, :alert => "Data Anda sudah dikumpulkan, tidak bisa diganti lagi"
      end
    else
      session[:after_sign_in_path_for] = edit_workshop_profile_candidates_path
      authenticate_user!
    end
  end
  
  def update_workshop
    @profile = current_user.profile_candidate
    if params[:changed] == 'true'
      if @profile.is_update_allowed && @profile.update_attributes({:workshop => params[:profile_candidate][:workshop], :is_update_allowed => false, :status => 'SUBMITTED'}, :as => :update_workshop)
        redirect_to profile_candidates_path, :notice => "Data Anda telah diupdate dan akan diproses oleh tim seleksi. Terimakasih" 
      else
        render "edit_workshop"
      end
    else
      @profile.update_attribute(:is_update_allowed, false)
      redirect_to profile_candidates_path, :notice => "Tidak ada perubahan. Data Anda akan diproses oleh tim seleksi. Terimakasih"
    end
  end
  
  def edit
    authorize! :update, ProfileCandidate, :message => 'Not authorized as a recruiter.'
    @profile = ProfileCandidate.find(params[:id])
  end
  
  def update_point
    authorize! :update, ProfileCandidate, :message => 'Not authorized as a recruiter.'
    @profile = ProfileCandidate.find(params[:profile_candidate][:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile_candidate], :as => :recruiter)
        @profile.update_attributes({:marked_by => current_user, :status => 'MARKED'}, :as => :recruiter)
        format.html { redirect_to recruiter_index_path, :notice => "Data telah disimpan" }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update_marked_by
    authorize! :update, ProfileCandidate, :message => 'Not authorized as a recruiter.'
    
    ProfileCandidate.update_all({marked_by_id: params[:recruiter][:id]}, {id: params[:profile_candidate_ids]})
    index_param = if params[:page] then {:page => params[:page]} end
    redirect_to recruiter_index_path(index_param)
  end
  
  def check_announcement(profile)
    is_announcement_displayed = profile.is_announcement_displayed
    if is_announcement_displayed
      profile.is_announcement_displayed = false
      profile.save
    end
    is_announcement_displayed
  end
end
