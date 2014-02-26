class CreateActivistProfiles < ActiveRecord::Migration
  def change
    create_table :activist_profiles do |t|
      t.text :activity1_information
      t.text :activity1_reason
      t.text :activity2_information
      t.text :activity2_reason
      t.text :activity3_information
      t.text :activity3_reason
      t.text :activity4_information
      t.text :activity4_reason
      t.text :activity5_information
      t.text :activity5_reason
      t.text :essay_about_pasca_training
      t.integer :tipografi
      t.integer :user_id

      t.timestamps
    end
  end
end
