class RecruiterController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :update, ProfileCandidate, :message => 'Not authorized as a recruiter.'

    if params[:format] == "xls"
      if current_user.has_role? "recruiter_coordinator"
        @profiles = ProfileCandidate.includes(:user).submitted
        if params[:marked_by_id]
          @profiles = @profiles.where(:marked_by_id => params[:marked_by_id])
        end
      else
        @profiles = ProfileCandidate.includes(:user).submitted.where(:marked_by_id => current_user.id)
      end
      respond_to do |format|
        format.xls
      end
    else
      if current_user.has_role? "recruiter_coordinator"
        @profiles = ProfileCandidate.includes([:user, :marked_by]).submitted
        if params[:marked_by_id]
          @profiles = @profiles.where(:marked_by_id => params[:marked_by_id])
        end
        @profiles = @profiles.paginate(:page => params[:page],:per_page => 20)
        
        @marked_count = Rails.cache.fetch('all_marked_count', :expires_in => 5.minutes) {
          ProfileCandidate.where(:status => 'MARKED').count
        }
        @submitted_count = Rails.cache.fetch('all_submitted_count', :expires_in => 5.minutes) {
          ProfileCandidate.where(:status => 'SUBMITTED').count
        }
        @is_recruiter_coordinator = true
      else
        @profiles = ProfileCandidate.includes([:user, :marked_by]).submitted.where(:marked_by_id => current_user.id).paginate(:page => params[:page],:per_page => 20)
        
        @marked_count = Rails.cache.fetch('marked_count_' + current_user.id.to_s, :expires_in => 5.minutes) {
          ProfileCandidate.where(:status => 'MARKED', :marked_by_id => current_user.id).count
        }
        @submitted_count = Rails.cache.fetch('submitted_count_' + current_user.id.to_s, :expires_in => 5.minutes) {
          ProfileCandidate.where(:status => 'SUBMITTED', :marked_by_id => current_user.id).count
        }
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
