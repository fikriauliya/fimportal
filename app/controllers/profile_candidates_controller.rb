class ProfileCandidatesController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :authenticate_user!, :only => [:new, :step1, :index]
  before_filter :check_submission_status!, :only => [:step2, :step3, :step4]
  
  def check_submission_status!
    @profile = current_user.profile_candidate
    if !@profile.nil? && @profile.status == "SUBMITTED"
      redirect_to profile_candidates_path, :notice => "Data Anda sudah kami terima. Terimakasih"
    end
  end
  
  def step1
    if user_signed_in?
      redirect_to step2_profile_candidates_path
    else
      flash[:from_step1] = true
    end
  end
  
  def step2
    @profile = current_user.profile_candidate
    
    if @profile.nil?
      @profile = ProfileCandidate.new
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
      respond_to do |format|
        format.html 
        format.json { render json: @profile }
      end
    end
  end
  
  def index
    @profiles = ProfileCandidate.where(:status => 'SUBMITTED').paginate(:page => params[:page],:per_page => 20)
    if user_signed_in?
      @profile = ProfileCandidate.find_by_user_id(current_user.id)
    end
    
    initialize_latitudes_longitudes(ProfileCandidate.where(:status => 'SUBMITTED').select([:latitude, :longitude]))
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  def show
    if params[:id] then
      @profile = ProfileCandidate.find(params[:id])
      authorize! :read, @profile, :message => 'Not authorized as a recruiter.'
      
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @profile }
      end
    else
      redirect_to profile_candidates_path
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
        format.html { redirect_to step3_profile_candidates_path, notice: 'Profile was successfully updated.' }
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
    if params[:confirmation] && params[:confirmation] == "1" && @profile.update_attribute(:status, 'SUBMITTED')
      redirect_to profile_candidates_path, notice: 'Data Anda sudah kami terima. Terimakasih'
    else
      redirect_to step5_profile_candidates_path, :alert => 'Anda harus mencentang persetujuan di bawah'
    end
  end
  
  #only for updating biodata
  def update_biodata
    @profile = current_user.profile_candidate
    
    respond_to do |format|
      if @profile.update_attributes(:biodata => params[:profile_candidate][:biodata])
        format.html { redirect_to profile_candidates_path, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        logger.info "Not Success!"
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
end