class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_user
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def initialize_user
    @new_user = User.new
  end
  
  def after_sign_in_path_for(resource)
    if session[:after_sign_in_path_for]
      redirect_url = session[:after_sign_in_path_for]
      session[:after_sign_in_path_for] = nil
      redirect_url
    else
      root_path
    end
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
