class AddAcceptedLocationChoicesToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :accepted_location_choices, :integer, :default => 0
  end
end
