ActiveAdmin.register Galleries do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :title, :body, :published, :photos_attributes => [:id, :title, :image]


  form do |f|
      f.inputs "Gallery" do 
        f.input :title
        f.input :body
        
        f.has_many :photos do |item|
          item.input :title
          item.input :image, :as => :file, hint: item.template.image_tag(item.object.image.url(:large))
        end

      end

      

      f.actions
    end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
