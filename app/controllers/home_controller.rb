class HomeController < ApplicationController
  def index
    (@latitudes, @longitudes) = get_profile_candidates_latitudes_longitudes
    @accepted_cibubur = ProfileCandidate.where(:is_accepted => true, :accepted_location => 'Cibubur')
    @accepted_bukittinggi = ProfileCandidate.where(:is_accepted => true, :accepted_location => 'Bukit Tinggi')
  end
  
  def closed
    flash[:alert] = "Pendaftaran FIM 14 telah ditutup. Terimakasih :)"
    redirect_to root_path
  end
  
  def faq
  end
end
