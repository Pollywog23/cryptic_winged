class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.text :body
      t.boolean :published 

      t.timestamps null: false
    end
  end
end
