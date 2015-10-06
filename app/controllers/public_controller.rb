class PublicController < ApplicationController
  
  def index  
    @galleries = Gallery.all
    @galleries = Gallery.where(:published => true).order(:created_at => 'DESC').limit(6)
    @galleries = Gallery.all.order(:created_at => 'desc').page([params[:page].to_i, 1].max).per(6)
    @photos = Photo.all.order(:created_at => 'desc').page([params[:page].to_i, 1].max).per(3)
  end

  def blog
    @blog_posts = BlogPost.all.order(:created_at => 'desc').page([params[:page].to_i, 1].max).per(3)
  end

end
