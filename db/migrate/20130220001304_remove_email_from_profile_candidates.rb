class RemoveEmailFromProfileCandidates < ActiveRecord::Migration
  def up
    remove_column :profile_candidates, :email
  end

  def down
    add_column :profile_candidates, :email, :string
  end
end
