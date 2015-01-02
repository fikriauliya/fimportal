class AddSomecolumn2ToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :question_1, :string
    add_column :profile_candidates, :question_2, :string
    add_column :profile_candidates, :question_3, :text
    add_column :profile_candidates, :question_4, :text
    add_column :profile_candidates, :question_5, :string
    add_column :profile_candidates, :question_6, :text
  end
end
