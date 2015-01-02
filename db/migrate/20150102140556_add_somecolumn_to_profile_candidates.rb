class AddSomecolumnToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :pararel_room_pendidikan_kebudayaan, :integer
    add_column :profile_candidates, :pararel_room_sosial_ekonomi, :integer
    add_column :profile_candidates, :pararel_room_politik_hukum, :integer
    add_column :profile_candidates, :creation_bung_hatta, :string
  end
end
