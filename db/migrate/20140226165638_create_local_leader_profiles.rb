class CreateLocalLeaderProfiles < ActiveRecord::Migration
  def change
    create_table :local_leader_profiles do |t|
      t.text :organization_information
      t.text :essay_about_organization
      t.integer :user_id

      t.timestamps
    end
  end
end
