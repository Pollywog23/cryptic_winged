class PublicController < ApplicationController
  
  def index  
    @galleries = Galleries.all
    @galleries = Galleries.where(:published => true).order(:created_at => 'DESC').limit(6)
  end

  def blog
    @blogs = Blog.all.order(:created_at => 'desc').page([params[:page].to_i, 1].max).per(3)
    logger.info "BLOGS: #{@blogs.count}"

  end

end
