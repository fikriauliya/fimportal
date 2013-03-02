module ProfileCandidatesHelper
  def all_school_json
    "[" + ProfileCandidate.all_school.collect{|s| '"' + s + '"'}.join(",") + "]"
  end
end
