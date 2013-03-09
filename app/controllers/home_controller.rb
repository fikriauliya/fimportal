class HomeController < ApplicationController
  def index
    (@latitudes, @longitudes) = get_profile_candidates_latitudes_longitudes
  end
end
