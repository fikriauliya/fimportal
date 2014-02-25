class RemoveDiskusiLiberalartsFromProfileCandidates < ActiveRecord::Migration
  def up
    remove_column :profile_candidates, :diskusi_liberalarts
  end

  def down
    add_column :profile_candidates, :diskusi_liberalarts, :string
  end
end
