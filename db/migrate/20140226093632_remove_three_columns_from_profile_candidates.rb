class RemoveThreeColumnsFromProfileCandidates < ActiveRecord::Migration
  def up
    remove_column :profile_candidates, :commit_fim_pusat
    remove_column :profile_candidates, :commit_fim_regional
    remove_column :profile_candidates, :commit_organisasi
  end

  def down
    add_column :profile_candidates, :commit_organisasi, :integer
    add_column :profile_candidates, :commit_fim_regional, :integer
    add_column :profile_candidates, :commit_fim_pusat, :integer
  end
end
