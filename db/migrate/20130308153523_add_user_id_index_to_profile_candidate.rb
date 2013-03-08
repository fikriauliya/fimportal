class AddUserIdIndexToProfileCandidate < ActiveRecord::Migration
  def change
    add_index :profile_candidates, :user_id, :unique => true
  end
end
