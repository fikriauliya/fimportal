class AddOtherCategoryColumnToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :other_category, :string
  end
end
