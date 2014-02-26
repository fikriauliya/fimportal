class RemoveSomeColumnFromStrategicLeaderProfiles < ActiveRecord::Migration
  def up
    remove_column :strategic_leader_profiles, :activity_name
    remove_column :strategic_leader_profiles, :activity_duration
    remove_column :strategic_leader_profiles, :activity_scope
    remove_column :strategic_leader_profiles, :activity_role
    remove_column :strategic_leader_profiles, :activity_leader_phone
    remove_column :strategic_leader_profiles, :activity_reason
  end

  def down
    add_column :strategic_leader_profiles, :activity_reason, :text
    add_column :strategic_leader_profiles, :activity_leader_phone, :string
    add_column :strategic_leader_profiles, :activity_role, :string
    add_column :strategic_leader_profiles, :activity_scope, :string
    add_column :strategic_leader_profiles, :activity_duration, :string
    add_column :strategic_leader_profiles, :activity_name, :string
  end
end
