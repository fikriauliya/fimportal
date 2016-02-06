class AddSomecolumnRecommendationPartTwoToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :advantages_of_candidate, :text
    add_column :profile_candidates, :disadvantages_of_candidates, :text
    add_column :profile_candidates, :why_this_candidate, :text
  end
end
