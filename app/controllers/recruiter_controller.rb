class RecruiterController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :update, ProfileCandidate, :message => 'Not authorized as a recruiter.'

    if params[:format] == "xls"
      @profiles = ProfileCandidate.where(:status => 'SUBMITTED').order("submitted_at ASC")
      respond_to do |format|
        format.xls
      end
    else
      @profiles = ProfileCandidate.where(:status => 'SUBMITTED').order("submitted_at ASC").paginate(:page => params[:page],:per_page => 20)
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @profiles }
      end
    end
  end
end
