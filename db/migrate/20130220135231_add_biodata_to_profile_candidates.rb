class AddBiodataToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :biodata, :text
  end
end
