class AddPersonTypeToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :person_type, :string
  end
end
