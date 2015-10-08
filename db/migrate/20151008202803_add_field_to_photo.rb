class AddFieldToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :owner_id, :integer
  end
end
