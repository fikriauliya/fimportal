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
      respond_to do |format|
        format.html 
        format.json { render json: @profile }
      end
    end
  end
  
  def index
    @profiles = ProfileCandidate.paginate(:page => params[:page],:per_page => 20)
    if user_signed_in?
      @profile = ProfileCandidate.find_by_user_id(current_user.id)
    end
    
    initialize_latitudes_longitudes(ProfileCandidate.select([:latitude, :longitude]))
    
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
    respond_to do |format|
      if params[:profile_candidate].nil? && @profile.photo?
        format.html { redirect_to step4_profile_candidates_path }
        format.json { render json: @profile, status: :created, location: @profile }
      elsif !params[:profile_candidate].nil? && @profile.update_attribute(:photo, params[:profile_candidate][:photo])
        format.html { redirect_to step4_profile_candidates_path }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        @profile.errors.add :photo, ''
        format.html { render action: "step3" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def upload_recommendation_letter
    @profile = current_user.profile_candidate
    respond_to do |format|
      if !params[:profile_candidate].nil?
        new_attr = Hash.new
        new_attr[:recommendation_letter] = params[:profile_candidate][:recommendation_letter]
        new_attr[:status] = "SUBMITTED" 
        if @profile.update_attributes(new_attr, :as => :final_step)
          format.html { redirect_to profile_candidates_path, notice: 'Data Anda sudah kami terima. Terimakasih' }
          format.json { render json: @profile, status: :created, location: @profile }
        else
          @profile.errors.add :recommendation_letter, ''
          format.html { render action: "step4" }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      else
        @profile.errors.add :recommendation_letter, ''
        format.html { render action: "step4" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
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
