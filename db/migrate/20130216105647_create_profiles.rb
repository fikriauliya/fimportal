class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fullname
      t.date :dob
      t.string :place_of_birth
      t.string :location
      t.text :motto
      t.text :interest
      t.integer :batch

      t.timestamps
    end
  end
end
