class AddActivityTwoToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :name_of_activity_two, :string
    add_column :profile_candidates, :time_of_activity_two, :string
    add_column :profile_candidates, :organizer_two, :string
    add_column :profile_candidates, :scope_two, :string
    add_column :profile_candidates, :achievment_two, :string
    add_column :profile_candidates, :Person_in_charge_two, :string
    add_column :profile_candidates, :reason_two, :text
  end
end
