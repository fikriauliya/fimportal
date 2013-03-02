class AddInspiringStoryToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :inspiring_story, :text
  end
end
