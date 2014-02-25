class RemoveSomeColumnFromProfileCandidates < ActiveRecord::Migration
  def up
    remove_column :profile_candidates, :commit_fim_pusat
    remove_column :profile_candidates, :commit_fim_regional
    remove_column :profile_candidates, :commit_organisasi
  end

  def down
    add_column :profile_candidates, :commit_organisasi, :boolean
    add_column :profile_candidates, :commit_fim_regional, :boolean
    add_column :profile_candidates, :commit_fim_pusat, :boolean
  end
end
