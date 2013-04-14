class AddIsAcceptancedToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :is_accepted, :boolean, :default => false
  end
end
