class AddColumnIsRecommendationTrueToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :is_recommendation_true, :boolean
  end
end
