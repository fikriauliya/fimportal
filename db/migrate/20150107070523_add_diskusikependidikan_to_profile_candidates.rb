class AddDiskusikependidikanToProfileCandidates < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :diskusi_kependidikan, :integer
  end
end
