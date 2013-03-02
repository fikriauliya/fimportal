class AddCollaborationToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :collaboration, :text
  end
end
