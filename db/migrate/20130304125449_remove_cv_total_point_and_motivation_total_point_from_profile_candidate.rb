class RemoveCvTotalPointAndMotivationTotalPointFromProfileCandidate < ActiveRecord::Migration
  def up
    remove_column :profile_candidates, :cv_total_point
    remove_column :profile_candidates, :motivation_total_point
  end

  def down
    add_column :profile_candidates, :cv_total_point, :float
    add_column :profile_candidates, :motivation_total_point, :float
  end
end
