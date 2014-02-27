class ActivistProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_submission_status!

  def new
    @profile = current_user.profile_candidate
    @activist_profile = current_user.activist_profile
    
    if @activist_profile.nil?
      @activist_profile = ActivistProfile.new
    else
      @is_announcement_displayed = check_announcement(@profile)
    end

    respond_to do |format|
      format.html
      format.json { render json: @activist_profile }
    end
  end

  def create
    @activist_profile = ActivistProfile.new(params[:activist_profile])
    @activist_profile.user_id = current_user.id
    
    respond_to do |format|
      if @activist_profile.save
        format.html { redirect_to step3_profile_candidates_path }
        format.json { render json: @activist_profile, status: :created, location: @activist_profile }
      else
        format.html
        format.json { render json: @activist_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @profile = current_user.profile_candidate
    @activist_profile = current_user.activist_profile
    
    respond_to do |format|
      if @activist_profile.update_attributes(params[:activist_activist_profile])
        format.html { redirect_to step3_profile_candidates_path, notice: 'Data Anda telah diupdate' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @activist_profile.errors, status: :unprocessable_entity }
      end
    end
  end
end