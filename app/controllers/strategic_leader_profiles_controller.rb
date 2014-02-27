class StrategicLeaderProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_submission_status!

  def new
    @profile = current_user.profile_candidate
    @strategic_leader_profile = current_user.strategic_leader_profile
    
    if @strategic_leader_profile.nil?
      @strategic_leader_profile = StrategicLeaderProfile.new
    else
      @is_announcement_displayed = check_announcement(@profile)
    end

    respond_to do |format|
      format.html
      format.json { render json: @strategic_leader_profile }
    end
  end

  def create
    @strategic_leader_profile = StrategicLeaderProfile.new(params[:strategic_leader_profile])
    @strategic_leader_profile.user_id = current_user.id
    
    respond_to do |format|
      if @strategic_leader_profile.save
        format.html { redirect_to step3_profile_candidates_path }
        format.json { render json: @strategic_leader_profile, status: :created, location: @strategic_leader_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @strategic_leader_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @profile = current_user.profile_candidate
    @strategic_leader_profile = current_user.strategic_leader_profile

    respond_to do |format|
      if @strategic_leader_profile.update_attributes(params[:strategic_leader_profile])
        format.html { redirect_to step3_profile_candidates_path, notice: 'Data Anda telah diupdate' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @strategic_leader_profile.errors, status: :unprocessable_entity }
      end
    end
  end
end