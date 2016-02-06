class AddActivityThreeToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :name_of_activity_three, :string
    add_column :profile_candidates, :time_of_activity_three, :string
    add_column :profile_candidates, :organizer_three, :string
    add_column :profile_candidates, :scope_three, :string
    add_column :profile_candidates, :achievment_three, :string
    add_column :profile_candidates, :Person_in_charge_three, :string
    add_column :profile_candidates, :reason_three, :text
  end
end
