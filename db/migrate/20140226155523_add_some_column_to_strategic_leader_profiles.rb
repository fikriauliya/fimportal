class AddSomeColumnToStrategicLeaderProfiles < ActiveRecord::Migration
  def change
    add_column :strategic_leader_profiles, :activity1_information, :text
    add_column :strategic_leader_profiles, :activity1_reason, :text
    add_column :strategic_leader_profiles, :activity2_information, :text
    add_column :strategic_leader_profiles, :activity2_reason, :text
    add_column :strategic_leader_profiles, :activity3_information, :text
    add_column :strategic_leader_profiles, :activity3_reason, :text
    add_column :strategic_leader_profiles, :activity4_information, :text
    add_column :strategic_leader_profiles, :activity4_reason, :text
    add_column :strategic_leader_profiles, :activity5_information, :text
    add_column :strategic_leader_profiles, :activity5_reason, :text
    add_column :strategic_leader_profiles, :organization_information, :text
    add_column :strategic_leader_profiles, :essay_about_indonesia, :text
  end
end
