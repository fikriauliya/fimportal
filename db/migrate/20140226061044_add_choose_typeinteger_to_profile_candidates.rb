class AddChooseTypeintegerToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :choose_type, :integer, :default => 0
  end
end
