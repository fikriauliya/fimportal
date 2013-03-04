class AddScoringColumnsToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :organization_point, :integer, :default => 0
    add_column :profile_candidates, :committee_point, :integer, :default => 0
    add_column :profile_candidates, :personal_knowledge_point, :integer, :default => 0
    add_column :profile_candidates, :document_completeness_point, :integer, :default => 0
    add_column :profile_candidates, :cv_total_point, :float
    
    add_column :profile_candidates, :reliability_point, :integer, :default => 0
    add_column :profile_candidates, :willingness_point, :integer, :default => 0
    add_column :profile_candidates, :motivation_total_point, :float
    
    add_column :profile_candidates, :special_location_comment, :string
    add_column :profile_candidates, :special_character_comment, :string
  end
end
