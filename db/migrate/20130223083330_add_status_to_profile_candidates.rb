class AddStatusToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :status, :string, :default => 'NOT SUBMITTED'
  end
end
