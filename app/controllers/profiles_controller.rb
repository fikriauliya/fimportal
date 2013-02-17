class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @profiles = Profile.all
  end
  
  def show
    if params[:id]
      @profile = Profile.find(params[:id])
    else 
      redirect_to root_path
      # @profile = Profile.find_by_id(current_user.id)
      # if @profile.nil?
        # redirect_to new_profile_path
      # else
        # respond_to do |format|
          # format.html # show.html.erb
          # format.json { render json: @profile }
        # end
      # end
    end
  end

  def new
    @profile = Profile.find_by_id(current_user.id)
    if !@profile.nil?
      redirect_to edit_profile_path
    else    
      @profile = Profile.new
    end
  end

  def create
    if !Profile.find_by_id(current_user.id).nil?
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
    @profile = Profile.find(current_user.id)
  end

  def update
    @profile = Profile.find(current_user.id)
    
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
