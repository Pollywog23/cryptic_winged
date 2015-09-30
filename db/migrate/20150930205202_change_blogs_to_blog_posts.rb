class ChangeBlogsToBlogPosts < ActiveRecord::Migration
  def change
     rename_table :blogs, :blog_posts
  end
end
