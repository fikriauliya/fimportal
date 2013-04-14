class AddAcceptedLocationToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :accepted_location, :string
  end
end
