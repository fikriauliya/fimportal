class HomeController < ApplicationController
  def index
    @profiles = ProfileCandidate.where(:status => 'SUBMITTED').select([:latitude, :longitude])
    initialize_latitudes_longitudes(@profiles)
  end
  
  def index_alumni
    authenticate_user!
    @profiles = Profile.all
    @profile = Profile.find_by_user_id(current_user.id)
    initialize_latitudes_longitudes(Profile.select([:latitude, :longitude]))
  end
end
