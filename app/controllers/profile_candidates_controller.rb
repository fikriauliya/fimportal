class ProfileCandidatesController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :authenticate_user!, :only => [:step1, :index]
  
  def step1
    if user_signed_in?
      redirect_to step2_profile_candidates_path
    else
      flash[:from_step1] = true
    end
  end
  
  def step2
    @profile = current_user.profile_candidate
    logger.info @profile.inspect
    
    if !@profile.nil?
      redirect_to candidate_home_path
    else
      @profile = ProfileCandidate.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @profile }
      end
    end
  end
  
  def index
    @profiles = ProfileCandidate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  def show
    if params[:id] then
      @profile = ProfileCandidate.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @profile }
      end
    else
      redirect_to candidate_home_path
    end
  end

  #redirec to step1
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
          format.html { redirect_to candidate_home_path, notice: 'Profile candidate was successfully created.' }
          format.json { render json: @profile, status: :created, location: @profile }
        else
          format.html { render action: "step2" }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  def update
    @profile = current_user.profile_candidate
    
    respond_to do |format|
      if @profile.update_attributes(:biodata => params[:profile_candidate][:biodata])
        format.html { redirect_to candidate_home_path, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        logger.info "Not Success!"
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
end
