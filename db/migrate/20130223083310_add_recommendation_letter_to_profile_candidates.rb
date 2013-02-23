class AddRecommendationLetterToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :recommendation_letter, :string
  end
end
