class HomeController < ApplicationController
  def index
    (@latitudes, @longitudes) = get_profile_candidates_latitudes_longitudes
    redirect_to 'http://wp.forumindonesiamuda.org/category/fim-15/'
  end

  def faq
  end
end
