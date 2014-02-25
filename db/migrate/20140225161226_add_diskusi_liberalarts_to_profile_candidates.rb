class AddDiskusiLiberalartsToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :diskusi_liberalarts, :integer
  end
end
