class AddPhotoToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :photo, :string
  end
end
