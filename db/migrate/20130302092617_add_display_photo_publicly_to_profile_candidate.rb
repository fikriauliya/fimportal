class AddDisplayPhotoPubliclyToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :display_photo_publicly, :boolean
  end
end
