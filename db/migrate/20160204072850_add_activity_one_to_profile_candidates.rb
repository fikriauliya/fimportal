class AddActivityOneToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :name_of_activity_one, :string
    add_column :profile_candidates, :time_of_activity_one, :string
    add_column :profile_candidates, :organizer_one, :string
    add_column :profile_candidates, :scope_one, :string
    add_column :profile_candidates, :achievment_one, :string
    add_column :profile_candidates, :Person_in_charge_one, :string
    add_column :profile_candidates, :reason_one, :text
  end
end
