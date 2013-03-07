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
  
  def new_upload
    authorize! :update, ProfileCandidate, :message => 'Not authorized as a recruiter.'
    
    render "new_upload"
  end

  def create_upload
    authorize! :update, ProfileCandidate, :message => 'Not authorized as a recruiter.'

    file = params[:file]
    @profiles = []
    CSV.foreach(file.path, headers: true) do |row|
      logger.info "row :"
      logger.info row.inspect

      profile = ProfileCandidate.find_by_id(row["Id"])
      if profile.marked_by == current_user
        profile.organization_point = ProfileCandidate.from_alphabet(row["Organisasi"])
        profile.committee_point = ProfileCandidate.from_alphabet(row["Kepanitiaan"])
        profile.personal_knowledge_point = ProfileCandidate.from_alphabet(row["Wawasan"])
        profile.document_completeness_point = ProfileCandidate.from_alphabet(row["Kelengkapan"])
        profile.reliability_point = ProfileCandidate.from_alphabet(row["Reliability"])
        profile.willingness_point = ProfileCandidate.from_alphabet(row["Willingness"])
      
        profile.special_location_comment = row["Domisili khusus"]
        profile.special_character_comment = row["Karakter khusus"]
        
        @profiles << profile
      end
    end
  end
  
  def save_upload
    authorize! :update, ProfileCandidate, :message => 'Not authorized as a recruiter.'
    
    profiles = params[:profile_candidates]
    profiles.each do |p|
      profile = ProfileCandidate.find_by_id(p[:id])
      if profile.marked_by == current_user
        profile.update_attributes!(p, :as => :recruiter)
      end
    end
    
    redirect_to recruiter_index_path, :notice => "Data sudah diupdate, mohon dikoreksi"
  end
end
