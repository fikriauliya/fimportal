class AddSomeColumnscommitfimToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :commit_fim_pusat, :integer
    add_column :profile_candidates, :commit_fim_regional, :integer
    add_column :profile_candidates, :commit_organisasi, :integer
  end
end
