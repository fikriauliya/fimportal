class RemoveCommentFromProfileCandidate < ActiveRecord::Migration
  def up
    remove_column :profile_candidates, :comment
  end

  def down
    add_column :profile_candidates, :comment, :string
  end
end
