class AddMarkedByIdToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :marked_by_id, :integer
  end
end
