class AddActivityFiveToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :name_of_activity_five, :string
    add_column :profile_candidates, :time_of_activity_five, :string
    add_column :profile_candidates, :organizer_five, :string
    add_column :profile_candidates, :scope_five, :string
    add_column :profile_candidates, :achievment_five, :string
    add_column :profile_candidates, :Person_in_charge_five, :string
    add_column :profile_candidates, :reason_five, :text
  end
end
