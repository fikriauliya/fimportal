class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @profiles = Profile.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end
  
  def show
    if params[:id]
      @profile = Profile.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @profile }
      end
    else 
      redirect_to alumni_home_path
    end
  end

  def new
    @profile = current_user.profile
    if !@profile.nil?
      redirect_to edit_profile_path
    else    
      @profile = Profile.new
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @profile }
      end
    end
  end

  def create
    if !current_user.profile.nil?
      redirect_to edit_profile_path
    else
      @profile = Profile.new(params[:profile])
      @profile.user_id = current_user.id

      respond_to do |format|
        if @profile.save
          format.html  { redirect_to @profile, notice: 'Profile was successfully created.'}
          format.json  { render json: @profile, status: :created, location: @profile }
        else
          format.html  { render action: "new" }
          format.json  { render json: @profile.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        logger.info "Not Success!"
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
end
