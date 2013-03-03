class HomeController < ApplicationController
  def index
    @profiles = ProfileCandidate.where(:status => 'SUBMITTED').select([:latitude, :longitude])
    initialize_latitudes_longitudes(@profiles)
  end
end
