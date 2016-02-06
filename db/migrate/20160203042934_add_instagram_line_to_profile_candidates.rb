class AddInstagramLineToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :instagram, :string
    add_column :profile_candidates, :line, :string
  end
end
