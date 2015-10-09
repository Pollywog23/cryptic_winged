class AddStickyToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :sticky, :boolean, :default => 0
  end
end
