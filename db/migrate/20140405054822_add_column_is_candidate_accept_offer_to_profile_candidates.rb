class AddColumnIsCandidateAcceptOfferToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :is_candidate_accept_offer, :boolean
  end
end
