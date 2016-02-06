class AddOtherTypeColumnToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :other_type, :string
  end
end
