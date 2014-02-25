class AddFoodExceptToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :food_except, :text
  end
end
