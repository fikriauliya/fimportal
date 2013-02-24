class RecruiterController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :update, ProfileCandidate, :message => 'Not authorized as an administrator.'

    @profiles = ProfileCandidate.paginate(:page => params[:page],:per_page => 20)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end
end
