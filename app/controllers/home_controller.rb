class HomeController < ApplicationController
  def index
    (@latitudes, @longitudes) = get_profile_candidates_latitudes_longitudes
  end
  
  def closed
    flash[:alert] = "Pendaftaran FIM 14 telah ditutup. Terimakasih :)"
    redirect_to root_path
  end
end
