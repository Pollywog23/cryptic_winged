class GalleriesController < InheritedResources::Base

  private

    def gallery_params
      params.require(:gallery).permit(:title, :gallery_photos_attributes => [:image, :title, :owner_id, :owner_type])
    end
end