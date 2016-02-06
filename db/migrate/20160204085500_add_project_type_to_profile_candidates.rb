class AddProjectTypeToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :project_type, :string
  end
end
