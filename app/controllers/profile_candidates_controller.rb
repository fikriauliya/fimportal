class ProfileCandidatesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @profiles = ProfileCandidate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  def show
    if params[:id] then
      @profile = ProfileCandidate.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @profile }
      end
    else
      redirect_to candidate_home_path
    end
  end

  def new
    # @profile = ProfileCandidate.find_by_id(current_user.id)
    # if !@profile.nil?
      # redirect_to candidate_home_path
    # else
    @profile = ProfileCandidate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
    # end
  end

  def create
    # if !ProfileCandidate.find_by_id(current_user.id).nil?
      # redirect_to candidate_home_path
    # else
    @profile = ProfileCandidate.new(params[:profile_candidate])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile candidate was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
    # end
  end
end
