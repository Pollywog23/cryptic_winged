class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.datetime :date
      t.boolean :published, :default => false

      t.timestamps null: false
    end
  end
end
