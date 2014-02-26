class AddChooseType2ToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :choose_type, :integer
  end
end
