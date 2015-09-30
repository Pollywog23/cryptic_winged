class AddFieldsToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :owner_type, :string
  end
end
