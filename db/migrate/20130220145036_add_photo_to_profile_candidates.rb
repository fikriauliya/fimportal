class AddPhotoToProfileCandidates < ActiveRecord::Migration
  def self.up
    add_attachment :profile_candidates, :photo
  end
  
  def self.down
    remove_attachment :profile_candidates, :photo
  end
end
