class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_user
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def initialize_user
    @user = User.new
  end
end
