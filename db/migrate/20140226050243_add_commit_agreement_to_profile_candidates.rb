class AddCommitAgreementToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :commit_agreement, :text
  end
end
