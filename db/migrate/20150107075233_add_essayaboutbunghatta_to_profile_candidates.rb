class AddEssayaboutbunghattaToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :essay_about_bunghatta, :text
  end
end
