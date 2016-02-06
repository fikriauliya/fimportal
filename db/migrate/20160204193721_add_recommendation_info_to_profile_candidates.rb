class AddRecommendationInfoToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :endorser_name, :string
    add_column :profile_candidates, :endorser_work, :string
    add_column :profile_candidates, :endorser_phone, :string
    add_column :profile_candidates, :how_long, :string
    add_column :profile_candidates, :how_come, :string
    add_column :profile_candidates, :nearness, :string
  end
end
