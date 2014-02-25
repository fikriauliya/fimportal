class AddApplicationCountToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :application_count, :text
  end
end
