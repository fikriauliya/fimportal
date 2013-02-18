class AddLatitudeLongitudeToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :latitude, :float
    add_column :profile_candidates, :longitude, :float
  end
end
