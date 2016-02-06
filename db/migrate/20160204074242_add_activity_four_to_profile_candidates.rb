class AddActivityFourToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :name_of_activity_four, :string
    add_column :profile_candidates, :time_of_activity_four, :string
    add_column :profile_candidates, :organizer_four, :string
    add_column :profile_candidates, :scope_four, :string
    add_column :profile_candidates, :achievment_four, :string
    add_column :profile_candidates, :Person_in_charge_four, :string
    add_column :profile_candidates, :reason_four, :text
  end
end
