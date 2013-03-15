class StatisticsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :authenticate_user!, :only => [:public]
  
  caches_action :public, :expires_in => 2.minutes
  
  def complete
    authorize! :index, User, :message => 'Not authorized as an administrator.'
    @provinces_count = ProfileCandidate.count(:all, :group => :province, :order => 'count_all DESC')
    @unexist_provinces = ProfileCandidate.all_province - @provinces_count.collect{|p| p[0]} 
    @schools_count = ProfileCandidate.count(:all, :group => :school, :order => 'count_all DESC')
  end
  
  def public
    @provinces_count = ProfileCandidate.where(:status => 'SUBMITTED').count(:all, :group => :province, :order => 'count_all DESC')
    @schools_count = ProfileCandidate.where(:status => 'SUBMITTED').count(:all, :group => :school, :order => 'count_all DESC')
  end
end
