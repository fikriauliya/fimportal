class AddFacebookTwitterAndIsEmailDisplayedToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :facebook, :string
    add_column :profile_candidates, :twitter, :string
    add_column :profile_candidates, :is_email_displayed, :boolean, :default => false
  end
end