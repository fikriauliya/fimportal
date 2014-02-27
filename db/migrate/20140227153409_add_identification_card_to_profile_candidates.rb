class AddIdentificationCardToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :identification_card, :string
  end
end
