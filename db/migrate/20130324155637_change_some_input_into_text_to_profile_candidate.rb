class ChangeSomeInputIntoTextToProfileCandidate < ActiveRecord::Migration
  def up
    change_column :profile_candidates, :location, :text, :limit => nil
    change_column :profile_candidates, :hobby, :text, :limit => nil
    change_column :profile_candidates, :performance_type, :text, :limit => nil
    change_column :profile_candidates, :referal, :text , :limit => nil
    change_column :profile_candidates, :special_location_comment, :text, :limit => nil
    change_column :profile_candidates, :special_character_comment, :text, :limit => nil
  end

  def down
    change_column :profile_candidates, :location, :string
    change_column :profile_candidates, :hobby, :string
    change_column :profile_candidates, :performance_type, :string
    change_column :profile_candidates, :referal, :string 
    change_column :profile_candidates, :special_location_comment, :string
    change_column :profile_candidates, :special_character_comment, :string
  end
end
