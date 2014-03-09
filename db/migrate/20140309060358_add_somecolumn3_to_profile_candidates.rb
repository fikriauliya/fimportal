class AddSomecolumn3ToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :essay_point, :integer, :default => 0
    add_column :profile_candidates, :cv_point, :integer, :default => 0
    add_column :profile_candidates, :recommendation_letter_point, :integer, :default => 0
  end
end
