class AddSomeColumnToLocalLeaderProfiles < ActiveRecord::Migration
  def change
    add_column :local_leader_profiles, :organization_name, :string
    add_column :local_leader_profiles, :organization_year, :integer
    add_column :local_leader_profiles, :organization_category, :string
    add_column :local_leader_profiles, :organization_activity, :text
    add_column :local_leader_profiles, :organization_count_member, :integer
    add_column :local_leader_profiles, :organization_goal, :text
    add_column :local_leader_profiles, :organization_achievement, :text
    add_column :local_leader_profiles, :organization_contact, :text
    add_column :local_leader_profiles, :organization_network, :text
  end
end
