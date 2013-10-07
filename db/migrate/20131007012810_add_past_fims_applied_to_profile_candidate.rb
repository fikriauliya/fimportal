class AddPastFimsAppliedToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :past_fims_applied, :string
  end
end
