class AddCommitmentsToProfileCandidate < ActiveRecord::Migration
  def change
    add_column :profile_candidates, :is_committed_to_central_fim, :boolean
    add_column :profile_candidates, :is_committed_to_regional_fim, :boolean
    add_column :profile_candidates, :is_committed_to_own_organization, :boolean
  end
end
