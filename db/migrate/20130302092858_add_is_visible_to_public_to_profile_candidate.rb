class AddIsVisibleToPublicToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :is_visible_to_public, :boolean, :default => 1
  end
end
