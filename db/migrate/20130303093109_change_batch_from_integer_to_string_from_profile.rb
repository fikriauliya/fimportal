class ChangeBatchFromIntegerToStringFromProfile < ActiveRecord::Migration
  def up
    remove_column :profiles, :batch
    add_column :profiles, :batch, :string
  end

  def down
    remove_column :profiles, :batch
    add_column :profiles, :batch, :integer
  end
end
