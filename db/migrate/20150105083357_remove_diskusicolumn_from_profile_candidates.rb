class RemoveDiskusicolumnFromProfileCandidates < ActiveRecord::Migration
  def up
    remove_column :profile_candidates, :diskusi_ekonomipembangunan
    remove_column :profile_candidates, :diskusi_kebijakanpublik
    remove_column :profile_candidates, :diskusi_energidanlingkungan
    remove_column :profile_candidates, :diskusi_pendidikandanparenting
    remove_column :profile_candidates, :diskusi_medialiterasi
    remove_column :profile_candidates, :diskusi_socialentre
    remove_column :profile_candidates, :diskusi_pangangizikesehatan
    remove_column :profile_candidates, :diskusi_travel
    remove_column :profile_candidates, :diskusi_peopledev
    remove_column :profile_candidates, :diskusi_liberalarts
  end

  def down
    add_column :profile_candidates, :diskusi_liberalarts, :string
    add_column :profile_candidates, :diskusi_peopledev, :string
    add_column :profile_candidates, :diskusi_travel, :string
    add_column :profile_candidates, :diskusi_pangangizikesehatan, :string
    add_column :profile_candidates, :diskusi_socialentre, :string
    add_column :profile_candidates, :diskusi_medialiterasi, :string
    add_column :profile_candidates, :diskusi_pendidikandanparenting, :string
    add_column :profile_candidates, :diskusi_energidanlingkungan, :string
    add_column :profile_candidates, :diskusi_kebijakanpublik, :string
    add_column :profile_candidates, :diskusi_ekonomipembangunan, :string
  end
end
