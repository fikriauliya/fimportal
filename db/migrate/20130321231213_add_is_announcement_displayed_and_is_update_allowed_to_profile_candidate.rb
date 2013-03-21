class AddIsAnnouncementDisplayedAndIsUpdateAllowedToProfileCandidate < ActiveRecord::Migration
  def up
    add_column :profile_candidates, :is_announcement_displayed, :boolean, :default => false
    add_column :profile_candidates, :is_update_allowed, :boolean, :default => false
    
    ProfileCandidate.update_all('is_announcement_displayed = 1', "status = 'NOT SUBMITTED'")
    ProfileCandidate.update_all('is_update_allowed = 1', "status = 'MARKED' OR status = 'SUBMITTED'")
  end
  
  def down
    remove_column :profile_candidates, :is_announcement_displayed
    remove_column :profile_candidates, :is_update_allowed
  end
end
