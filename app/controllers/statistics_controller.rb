class StatisticsController < ApplicationController
  # before_filter :authenticate_user!
  # skip_before_filter :authenticate_user!, :only => [:public]
  
  caches_action [:public, :complete], :expires_in => 2.minutes
  
  def complete
    # authorize! :index, User, :message => 'Not authorized as an administrator.'
    @provinces_count = ProfileCandidate.count(:all, :group => :province, :order => 'count_all DESC')
    @unexist_provinces = ProfileCandidate.all_province - @provinces_count.collect{|p| p[0]} 
    @schools_count = ProfileCandidate.count(:all, :group => :school, :order => 'count_all DESC')
  end
  
  def public
    @provinces_count = ProfileCandidate.where("status = 'SUBMITTED' or status = 'MARKED'").count(:all, :group => :province, :order => 'count_all DESC')
    @schools_count = ProfileCandidate.where("status = 'SUBMITTED' or status = 'MARKED'").count(:all, :group => :school, :order => 'count_all DESC')
  end
  
  def not_submitted_emails
    authorize! :index, User, :message => 'Not authorized as an administrator.'
    emails = User.joins("LEFT OUTER JOIN profile_candidates ON users.id = profile_candidates.user_id WHERE profile_candidates.status = 'NOT SUBMITTED' OR profile_candidates.status IS NULL").select(:email).collect{|e| e.email}
    render :text => emails.join(', ')
  end
  
  def not_submitted_phones
    authorize! :index, User, :message => 'Not authorized as an administrator.'
    phones = ProfileCandidate.where("status = 'NOT SUBMITTED'").select(:phone).collect{|e| e.phone}
    render :text => phones.join(', ')
  end
  
  def is_update_allowed_emails
    authorize! :index, User, :message => 'Not authorized as an administrator.'
    emails = User.joins("LEFT OUTER JOIN profile_candidates ON users.id = profile_candidates.user_id WHERE profile_candidates.is_update_allowed = true").select(:email).collect{|e| e.email}
    render :text => emails.join(', ')
  end
  
  def submitted_emails
    authorize! :index, User, :message => 'Not authorized as an administrator.'
    emails = ProfileCandidate.includes(:user).where("STATUS <> 'NOT SUBMITTED'").collect{|e| e.user.email}
    render :text => emails.join(', ')
  end
end
