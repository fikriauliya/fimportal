class RecruiterController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :update, ProfileCandidate, :message => 'Not authorized as a recruiter.'

    if params[:format] == "xls"
      if current_user.has_role? "recruiter_coordinator"
        @profiles = ProfileCandidate.where(:status => 'SUBMITTED').order("submitted_at ASC")
      else
        @profiles = ProfileCandidate.where(:status => 'SUBMITTED', :marked_by_id => current_user.id).order("submitted_at ASC")
      end
      respond_to do |format|
        format.xls
      end
    else
      if current_user.has_role? "recruiter_coordinator"
        @profiles = ProfileCandidate.where(:status => 'SUBMITTED').order("submitted_at ASC").paginate(:page => params[:page],:per_page => 20)
        @is_recruiter_coordinator = true
      else
        @profiles = ProfileCandidate.where(:status => 'SUBMITTED', :marked_by_id => current_user.id).order("submitted_at ASC").paginate(:page => params[:page],:per_page => 20)
        @is_recruiter_coordinator = false
      end
              
      @recruiter = current_user      
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @profiles }
      end
    end
  end
end
