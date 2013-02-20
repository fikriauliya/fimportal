class HomeController < ApplicationController
  def index
    @profiles = ProfileCandidate.all
    initialize_latitudes_longitudes(@profiles)
  end
  
  def index_alumni
    authenticate_user!
    @profiles = Profile.all
    @profile = Profile.find_by_user_id(current_user.id)
    initialize_latitudes_longitudes(@profiles)
  end
  
  def index_candidate
    authenticate_user!
    @profiles = ProfileCandidate.all
    @profile = ProfileCandidate.find_by_user_id(current_user.id)
    initialize_latitudes_longitudes(@profiles)
  end
  
  private
  
  def initialize_latitudes_longitudes(profiles)
    @latitudes = []
    @longitudes = []
   
    profiles.each do |p|
      unless p.latitude.nil? or p.longitude.nil?
        @latitudes << p.latitude
        @longitudes << p.longitude
      end
    end
  end
end
