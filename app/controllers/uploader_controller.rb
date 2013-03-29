class UploaderController < ApplicationController
  before_filter :authenticate_user!
  
  def edit_profile_candidate
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
  end
  
  def upload_profile_candidate
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @profile = current_user.profile_candidate
    
    filename = params[:filename]
    logger.info "Filename: #{filename}"
    
    @message = ""
    
    photo_match = /^(.+)_Foto(.*)$/i.match(filename)
    unless photo_match.nil?
      @message << "Matched photo\\n"
      email = photo_match[1]
      user = User.find_by_email(email)
      
      unless user.nil?
        profile_candidate = user.profile_candidate
        if !profile_candidate.nil? && !profile_candidate.photo?
          profile_candidate.photo = params[:file]
          profile_candidate.save!
          logger.info "Photo => #{params[:file]}\\n"
          @message << "#{email} = #{params[:file]}\\n"
        else
          logger.info "#{email} already have photo\\n"
          @message << "#{email} already have photo\\n"
        end
      else
        @message << "No user = #{email}\\n"
      end
    end
    
    recommendation_letter_match = /^(.+)_Rekomendasi(.*)$/i.match(filename)
    unless recommendation_letter_match.nil?
      @message << "Matched recommendation letter\\n"
      email = recommendation_letter_match[1]
      user = User.find_by_email(email)
      
      unless user.nil?
        profile_candidate = user.profile_candidate
        if !profile_candidate.nil? && profile_candidate.photo? && !profile_candidate.recommendation_letter?
          profile_candidate.recommendation_letter = params[:file]
          profile_candidate.save!
          logger.info "Recommendation letter => #{params[:file]}\\n"
          @message << "#{email} = #{params[:file]}\\n"
        else
          logger.info "#{email} already have recommendation letter\\n"
          @message << "#{email} already have recommendation letter\\n"
        end
      else
        @message << "No user = #{email}\\n"
      end
    end
    
    logger.info @message
    render "profile_candidate_upload_response", :layout => false
  end
end
