class HomeController < ApplicationController
  def index
    @profiles = ProfileCandidate.submitted.where(:is_visible_to_public => true).select([:latitude, :longitude])
    initialize_latitudes_longitudes(@profiles)
  end
end
