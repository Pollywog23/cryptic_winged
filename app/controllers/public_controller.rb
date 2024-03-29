class PublicController < ApplicationController
  
  def index  
    @galleries = Gallery.where(:published => true).order(:sticky => 'DESC', :created_at => 'DESC').limit(6)
    @photos = Photo.all.order(:created_at => 'desc').page([params[:page].to_i, 1].max).per(3)
  end

  def blog
    @blog_posts = BlogPost.all.order(:created_at => 'desc').page([params[:page].to_i, 1].max).per(3)
  end

end
