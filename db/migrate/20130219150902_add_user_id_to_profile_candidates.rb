class AddUserIdToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :user_id, :integer
  end
end
