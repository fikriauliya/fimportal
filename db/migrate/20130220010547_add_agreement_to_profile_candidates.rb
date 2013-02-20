class AddAgreementToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :agreement, :text
  end
end
