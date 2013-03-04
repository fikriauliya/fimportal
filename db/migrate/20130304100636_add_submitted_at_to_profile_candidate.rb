class AddSubmittedAtToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :submitted_at, :datetime
  end
end
