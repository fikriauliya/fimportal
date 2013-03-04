class RemovePointFromProfileCandidate < ActiveRecord::Migration
  def up
    remove_column :profile_candidates, :point
  end

  def down
    add_column :profile_candidates, :point, :float
  end
end
