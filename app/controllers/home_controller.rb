class HomeController < ApplicationController
  def index
    @profiles = Profile.all
  end
  
  def index_alumni
    authenticate_user!
    @profiles = Profile.all
    @profile = Profile.find_by_id(current_user.id)
  end
  
  def index_candidate
    authenticate_user!
    @profiles = ProfileCandidate.all
    @profile = ProfileCandidate.find_by_id(current_user.id)
  end
end
