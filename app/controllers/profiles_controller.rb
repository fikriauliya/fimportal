class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :authenticate_user!, :only => [:new, :index] 
  
  def index
    @user = User.new
    if user_signed_in?
      @profiles = Profile.all
      @profile = Profile.find_by_user_id(current_user.id)
      (@latitudes, @longitudes) = get_latitudes_longitudes(Profile.select([:latitude, :longitude]))
    else
      session[:after_sign_in_path_for] = profiles_path
      render "welcome"
    end
  end

  def new
    @user = User.new
    if user_signed_in?
      @profile = current_user.profile
      if !@profile.nil?
        redirect_to profiles_path
      else    
        @profile = Profile.new
        
        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @profile }
        end
      end
    else
      session[:after_sign_in_path_for] = new_profile_path
      render "welcome"
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
          format.html  { redirect_to profiles_path, notice: 'Data Anda telah diupdate.'}
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
        format.html { redirect_to profiles_path, notice: 'Data Anda telah diupdate.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
end
