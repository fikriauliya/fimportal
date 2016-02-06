class AddProjectDescriptionToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :project_name, :string
    add_column :profile_candidates, :why, :text
    add_column :profile_candidates, :who, :text
    add_column :profile_candidates, :where, :text
    add_column :profile_candidates, :what, :text
    add_column :profile_candidates, :indicator, :text
    add_column :profile_candidates, :scale, :string
    add_column :profile_candidates, :strength, :text
    add_column :profile_candidates, :this_year, :string
    add_column :profile_candidates, :impact, :string
    add_column :profile_candidates, :right_person, :string
    add_column :profile_candidates, :plan_implementation, :text
  end
end
