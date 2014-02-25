class AddSomeColumnscommitfimdefaultToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :commit_fim_pusat, :integer, :default => 0
    add_column :profile_candidates, :commit_fim_regional, :integer, :default => 0
    add_column :profile_candidates, :commit_organisasi, :integer, :default => 0
  end
end
