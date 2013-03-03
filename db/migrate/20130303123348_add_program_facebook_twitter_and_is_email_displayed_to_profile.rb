class AddProgramFacebookTwitterAndIsEmailDisplayedToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :program, :text
    add_column :profiles, :facebook, :string
    add_column :profiles, :twitter, :string
    add_column :profiles, :is_email_displayed, :boolean, :default => false
  end
end
