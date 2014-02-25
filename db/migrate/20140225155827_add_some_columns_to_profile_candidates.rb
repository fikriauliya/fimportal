class AddSomeColumnsToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :commit_fim_pusat, :boolean
    add_column :profile_candidates, :commit_fim_regional, :boolean
    add_column :profile_candidates, :commit_organisasi, :boolean
  end
end
