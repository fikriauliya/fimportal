class StatisticsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    authorize! :index, User, :message => 'Not authorized as an administrator.'
  end
end
