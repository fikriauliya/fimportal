class HomeController < ApplicationController
  def index
    @profiles = Profile.all
  end
  
  def index_authenticated
    authenticate_user!
    @profiles = Profile.all
    @profile = Profile.find_by_id(current_user.id)
  end
end
