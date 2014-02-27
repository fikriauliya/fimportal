class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_user
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def initialize_user
    @new_user = User.new
  end
  
  def after_sign_in_path_for(resource)
    if session[:after_sign_in_path_for]
      redirect_url = session[:after_sign_in_path_for]
      session[:after_sign_in_path_for] = nil
      redirect_url
    else
      root_path
    end
  end
  
  private
  
  def get_latitudes_longitudes(profiles)
    latitudes = []
    longitudes = []
   
    profiles.each do |p|
      unless p.latitude.nil? or p.longitude.nil?
        latitudes << p.latitude
        longitudes << p.longitude
      end
    end
    [latitudes, longitudes]
  end
  
  def get_profile_candidates_latitudes_longitudes
    Rails.cache.fetch('profile_candidates_latitudes_longitudes') {
      profiles = ProfileCandidate.submitted.where(:is_visible_to_public => true).select([:latitude, :longitude])
      get_latitudes_longitudes(profiles)
    }
  end

  def check_submission_status!
    @profile = current_user.profile_candidate
    if !@profile.nil? && (@profile.status == "SUBMITTED" || @profile.status == "MARKED")
      redirect_to profile_candidates_path, :notice => "Data Anda sudah kami terima. Terimakasih"
    end
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
