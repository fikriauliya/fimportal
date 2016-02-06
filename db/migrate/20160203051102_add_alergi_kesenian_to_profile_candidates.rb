class AddAlergiKesenianToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :alergi_makanan, :text
    add_column :profile_candidates, :kesenian, :text
  end
end
