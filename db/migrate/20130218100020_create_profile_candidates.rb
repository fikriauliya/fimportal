class CreateProfileCandidates < ActiveRecord::Migration
  def change
    create_table :profile_candidates do |t|
      t.string :fullname
      t.date :dob
      t.string :place_of_birth
      t.string :location
      t.binary :gender
      t.string :religion
      t.string :phone
      t.string :email
      t.string :hobby
      t.string :blood_type
      t.string :school
      t.integer :batch
      t.text :non_formal_education
      t.text :organization
      t.text :committee
      t.text :workshop
      t.text :motivation
      t.string :information_from
      t.integer :application_count
      t.string :performance_type
      t.string :referal

      t.timestamps
    end
  end
end
