class PhotosController < ApplicationController

  def index
    @galleries = Galleries.find(params[:gallery_id])
    @photos = @galleries.photos.where(:published => true).order('created_at')
   # @jobs = @Gallery.find(params[:jobs_id])

  end

end