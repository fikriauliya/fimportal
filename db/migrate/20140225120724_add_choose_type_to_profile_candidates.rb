class AddChooseTypeToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :choose_type, :string
  end
end
