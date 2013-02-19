class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_user
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def initialize_user
    @user = User.new
  end
  
  def after_sign_in_path_for(resource)
    if flash[:from_step1]
      step2_profile_candidates_path
    else
      root_path
    end
  end
end
