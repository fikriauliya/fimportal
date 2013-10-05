class RecruiterController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :update, ProfileCandidate, :message => 'Not authorized as a recruiter.'

    if params[:format] == "xls"
      if current_user.has_role? "recruiter_coordinator"
        @profiles = ProfileCandidate.includes([:user, :marked_by]).submitted
        if params[:marked_by_id]
          @profiles = @profiles.where(:marked_by_id => params[:marked_by_id])
        end
      else
        @profiles = ProfileCandidate.includes([:user, :marked_by]).submitted.where(:marked_by_id => current_user.id)
      end
      
      if params[:province]
        @profiles = @profiles.where(:province => params[:province])
      end
      if params[:fullname]
        @profiles = @profiles.where("lower(fullname) like lower('%' || ? || '%')", params[:fullname])
      end
      if params[:school]
        @profiles = @profiles.where(:school => params[:school])
      end
      if params[:gender]
        @profiles = @profiles.where(:gender => params[:gender])
      end
      if params[:religion]
        @profiles = @profiles.where(:religion => params[:religion])
      end
      if params[:order] == 'point'
        @profiles = @profiles.select('*, 65 * (30 * organization_point + 30 * committee_point + 30 * personal_knowledge_point + 10 * document_completeness_point) + 35 * (50 * reliability_point + 50 * willingness_point) as total_point_sql')
          .order('total_point_sql DESC')
      else
        @profiles = @profiles.chronological
      end
      if params[:unassigned]
        @profiles = @profiles.where(:status => "SUBMITTED")
      end
      
      respond_to do |format|
        format.xls
      end
    else
      @provinces_count = ProfileCandidate.where("status = 'SUBMITTED' or status = 'MARKED'").count(:all, :group => :province, :order => 'count_all DESC')
      @schools_count = ProfileCandidate.where("status = 'SUBMITTED' or status = 'MARKED'").count(:all, :group => :school, :order => 'count_all DESC')
      @genders_count = ProfileCandidate.where("status = 'SUBMITTED' or status = 'MARKED'").count(:all, :group => :gender, :order => 'count_all DESC')
      @religions_count = ProfileCandidate.where("status = 'SUBMITTED' or status = 'MARKED'").count(:all, :group => :religion, :order => 'count_all DESC')
      
      if current_user.has_role? "recruiter_coordinator"
        @profiles = ProfileCandidate.includes([:user, :marked_by]).submitted
        if params[:marked_by_id]
          @profiles = @profiles.where(:marked_by_id => params[:marked_by_id])
        end
        
        @is_recruiter_coordinator = true
      else
        @profiles = ProfileCandidate.includes([:user, :marked_by]).submitted.where(:marked_by_id => current_user.id)
        @is_recruiter_coordinator = false
      end
        
      if params[:province]
        @profiles = @profiles.where(:province => params[:province])
      end
      if params[:fullname]
        @profiles = @profiles.where("lower(fullname) like lower('%' || ? || '%')", params[:fullname])
      end
      if params[:school]
        @profiles = @profiles.where(:school => params[:school])
      end
      if params[:gender]
        @profiles = @profiles.where(:gender => params[:gender])
      end
      if params[:religion]
        @profiles = @profiles.where(:religion => params[:religion])
      end
      if params[:order] == 'point'
        @profiles = @profiles.select('*, 65 * (30 * organization_point + 30 * committee_point + 30 * personal_knowledge_point + 10 * document_completeness_point) + 35 * (50 * reliability_point + 50 * willingness_point) as total_point_sql')
          .order('total_point_sql DESC')
      else
        @profiles = @profiles.chronological
      end
      
      @profiles = @profiles.paginate(:page => params[:page],:per_page => 20)      
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
        p[:status] = 'MARKED'
        profile.update_attributes!(p, :as => :recruiter)
      end
    end
    
    redirect_to recruiter_index_path, :notice => "Data sudah diupdate, mohon dikoreksi"
  end
end
