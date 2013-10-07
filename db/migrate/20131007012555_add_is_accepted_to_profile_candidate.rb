class AddIsAcceptedToProfileCandidate < ActiveRecord::Migration
  def up
  	ProfileCandidate.reset_column_information
    add_column :profile_candidates, :is_accepted, :boolean, :default => false unless ProfileCandidate.column_names.include?('is_accepted')
  end

  def down
  	ProfileCandidate.reset_column_information
  	remove_column :profile_candidates, :is_accepted if ProfileCandidate.column_names.include?('is_accepted')
  end
end
