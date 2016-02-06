class AddSomecolumnRecommendationPartOneToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :leadership, :integer
    add_column :profile_candidates, :problem_solving, :integer
    add_column :profile_candidates, :team_management, :integer
    add_column :profile_candidates, :public_speaking, :integer
    add_column :profile_candidates, :creative, :integer
    add_column :profile_candidates, :obedient, :integer
  end
end
