class AddEndorserEmailToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :endorser_email, :string
  end
end
