class CreateStrategicLeaderProfiles < ActiveRecord::Migration
  def change
    create_table :strategic_leader_profiles do |t|
      t.string :activity_name
      t.string :activity_duration
      t.string :activity_scope
      t.string :activity_role
      t.string :activity_leader_phone
      t.text :activity_reason

      t.timestamps
    end
  end
end
