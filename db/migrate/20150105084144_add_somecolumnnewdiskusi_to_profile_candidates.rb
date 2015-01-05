class AddSomecolumnnewdiskusiToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :diskusi_pangan, :integer
    add_column :profile_candidates, :diskusi_kebijakan_publik, :integer
    add_column :profile_candidates, :diskusi_energi_lingkungan, :integer
    add_column :profile_candidates, :diskusi_parenting, :integer
    add_column :profile_candidates, :diskusi_media_literasi, :integer
    add_column :profile_candidates, :diskusi_sosial_enterpreneurship, :integer
    add_column :profile_candidates, :diskusi_kesehatan, :integer
    add_column :profile_candidates, :diskusi_travel_adventure, :integer
    add_column :profile_candidates, :diskusi_liberal_arts, :integer
    add_column :profile_candidates, :diskusi_personal_people_development, :integer
    add_column :profile_candidates, :diskusi_masyarakat_ekonomi_ASEAN, :integer
    add_column :profile_candidates, :diskusi_sinematografi, :integer
    add_column :profile_candidates, :diskusi_budaya, :integer
  end
end
