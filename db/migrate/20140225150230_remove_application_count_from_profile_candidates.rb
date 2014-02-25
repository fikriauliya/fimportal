class RemoveApplicationCountFromProfileCandidates < ActiveRecord::Migration
  def up
    remove_column :profile_candidates, :application_count
  end

  def down
    add_column :profile_candidates, :application_count, :integer
  end
end
