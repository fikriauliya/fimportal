class AddProvinceToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :province, :string
  end
end
