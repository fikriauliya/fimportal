class AddIsPhotoVisibleToPublicToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :is_photo_visible_to_public, :boolean, :default => false
  end
end
