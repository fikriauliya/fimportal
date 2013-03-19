module RecruiterHelper
  def count_marked(recruiter_id=:all)
    if recruiter_id == :all
      ProfileCandidate.where(:status => 'MARKED').count
    else
      ProfileCandidate.where(:status => 'MARKED', :marked_by_id => recruiter_id).count
    end
  end
  
  def count_submitted(recruiter_id=:all)
    if recruiter_id == :all
      ProfileCandidate.where(:status => 'SUBMITTED').count
    else
      ProfileCandidate.where(:status => 'SUBMITTED', :marked_by_id => recruiter_id).count
    end
  end
  
  def average_point(recruiter_id=:all)
    if recruiter_id == :all
      profiles = ProfileCandidate.where(:status => 'MARKED').select([:organization_point, :committee_point, 
        :personal_knowledge_point, :document_completeness_point,
        :reliability_point, :willingness_point])
      if profiles.length == 0
        nil
      else
        (profiles.inject(0.0){|sum, el| sum + el.total_point}/profiles.length).round(2)
      end
    else
      profiles = ProfileCandidate.where(:status => 'MARKED', :marked_by_id => recruiter_id).select([:organization_point, :committee_point, 
        :personal_knowledge_point, :document_completeness_point,
        :reliability_point, :willingness_point])
      if profiles.length == 0
        nil
      else
        (profiles.inject(0.0){|sum, el| sum + el.total_point}/profiles.length).round(2)
      end
    end
  end
  
  def min_point(recruiter_id=:all)
    if recruiter_id == :all
      profiles = ProfileCandidate.where(:status => 'MARKED').select([:organization_point, :committee_point, 
        :personal_knowledge_point, :document_completeness_point,
        :reliability_point, :willingness_point])
      profiles.collect{|p| p.total_point}.min
    else
      profiles = ProfileCandidate.where(:status => 'MARKED', :marked_by_id => recruiter_id).select([:organization_point, :committee_point, 
        :personal_knowledge_point, :document_completeness_point,
        :reliability_point, :willingness_point])
      profiles.collect{|p| p.total_point}.min
    end
  end
  
  def max_point(recruiter_id=:all)
    if recruiter_id == :all
      profiles = ProfileCandidate.where(:status => 'MARKED').select([:organization_point, :committee_point, 
        :personal_knowledge_point, :document_completeness_point,
        :reliability_point, :willingness_point])
      max_profile = profiles.collect{|p| p.total_point}.max
    else
      profiles = ProfileCandidate.where(:status => 'MARKED', :marked_by_id => recruiter_id).select([:organization_point, :committee_point, 
        :personal_knowledge_point, :document_completeness_point,
        :reliability_point, :willingness_point])
      max_profile = profiles.collect{|p| p.total_point}.max
    end
  end
end
