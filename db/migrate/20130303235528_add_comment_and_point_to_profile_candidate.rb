class AddCommentAndPointToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :comment, :string
    add_column :profile_candidates, :point, :float
  end
end
