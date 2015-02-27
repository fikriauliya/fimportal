class StatisticsController < ApplicationController
  # before_filter :authenticate_user!
  # skip_before_filter :authenticate_user!, :only => [:public]
  
  caches_action [:public, :complete], :expires_in => 2.minutes
  
  def complete
    # authorize! :index, User, :message => 'Not authorized as an administrator.'
    @provinces_count = ProfileCandidate.joins("INNER JOIN users ON users.id = profile_candidates.user_id AND users.current_sign_in_at >= '09-01-2013'").count(:all, :group => 'profile_candidates.province', :order => 'count_all DESC')
    @unexist_provinces = ProfileCandidate.all_province - @provinces_count.collect{|p| p[0]} 
    @schools_count = ProfileCandidate.joins("INNER JOIN users ON users.id = profile_candidates.user_id AND users.current_sign_in_at >= '09-01-2013'").count(:all, :group => 'profile_candidates.school', :order => 'count_all DESC')

    @new_users = User.where("current_sign_in_at >= '09-01-2013'").count(:all, :group => "(date(created_at) || to_char(date_part('hour', created_at),'999D9'))")
    @new_profile_candidates = ProfileCandidate.joins("INNER JOIN users ON users.id = profile_candidates.user_id AND users.current_sign_in_at >= '09-01-2013'").count(:all, :group => "(date(profile_candidates.created_at) || to_char(date_part('hour', profile_candidates.created_at),'999D9'))")
    @new_submissions = ProfileCandidate.joins("INNER JOIN users ON users.id = profile_candidates.user_id AND users.current_sign_in_at >= '09-01-2013'").count(:all, :group => "(date(profile_candidates.submitted_at) || to_char(date_part('hour', profile_candidates.submitted_at),'999D9'))")
  end
  
  def public
    @provinces_count = ProfileCandidate.joins("INNER JOIN users ON users.id = profile_candidates.user_id AND users.current_sign_in_at >= '09-01-2013' WHERE profile_candidates.status = 'SUBMITTED' or profile_candidates.status = 'MARKED'").count(:all, :group => 'profile_candidates.province', :order => 'count_all DESC')
    @schools_count = ProfileCandidate.joins("INNER JOIN users ON users.id = profile_candidates.user_id AND users.current_sign_in_at >= '09-01-2013' WHERE profile_candidates.status = 'SUBMITTED' or profile_candidates.status = 'MARKED'").count(:all, :group => 'profile_candidates.school', :order => 'count_all DESC')
  end
  
  def not_submitted_emails
    authorize! :index, User, :message => 'Not authorized as an administrator.'
    emails = User.joins("LEFT OUTER JOIN profile_candidates ON users.id = profile_candidates.user_id WHERE (profile_candidates.status = 'NOT SUBMITTED' OR profile_candidates.status IS NULL) AND users.current_sign_in_at >= '09-01-2013'").select(:email).collect{|e| e.email}
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

  def old_user_emails
    authorize! :index, User, :message => 'Not authorized as an administrator.'
    emails = User.joins("INNER JOIN profile_candidates ON users.id = profile_candidates.user_id WHERE users.created_at < '09-01-2013'").select{|s| s.email}.collect{|e| e.email}
    render :text => emails.join(', ')
  end
end