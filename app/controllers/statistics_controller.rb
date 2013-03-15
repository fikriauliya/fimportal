class StatisticsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    authorize! :index, User, :message => 'Not authorized as an administrator.'
    @provinces_count = ProfileCandidate.count(:all, :group => :province, :order => 'count_all DESC')
    @unexist_provinces = ProfileCandidate.all_province - @provinces_count.collect{|p| p[0]} 
  end
end
