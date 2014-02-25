class AddSomeColumns10ToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :diskusi_ekonomipembangunan, :integer
    add_column :profile_candidates, :diskusi_kebijakanpublik, :integer
    add_column :profile_candidates, :diskusi_energidanlingkungan, :integer
    add_column :profile_candidates, :diskusi_pendidikandanparenting, :integer
    add_column :profile_candidates, :diskusi_medialiterasi, :integer
    add_column :profile_candidates, :diskusi_socialentre, :integer
    add_column :profile_candidates, :diskusi_pangangizikesehatan, :integer
    add_column :profile_candidates, :diskusi_travel, :integer
    add_column :profile_candidates, :diskusi_liberalarts, :string
    add_column :profile_candidates, :diskusi_peopledev, :integer
  end
end
