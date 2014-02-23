class AddUserIdToStrategicLeaderProfiles < ActiveRecord::Migration
  def change
    add_column :strategic_leader_profiles, :user_id, :integer
  end
end
