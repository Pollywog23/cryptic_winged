class AddMatureToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :mature, :boolean
  end
end
