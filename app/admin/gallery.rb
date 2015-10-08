ActiveAdmin.register Gallery do
# ActiveAdmin.register Photo do
# belongs_to :photo
#  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  index do
    selectable_column
    column :title
    column :published
    column :mature
    actions
  end
  



  permit_params :title, :body, :published, :mature, :image, :photos_attributes => [:id, :title, :image]

  scope :all, default: true
  scope("Hidden") { |scope| scope.where(published: false) }
  scope("Published") { |scope| scope.where(published: true) }
  scope("Mature") { |scope| scope.where(mature: true) }

  form do |f|
    f.inputs "Galleries" do 
      f.input :title
      f.input :body, input_html:{class: 'redactor'}
      f.input :published
      f.input :mature
      
      f.has_many :photos do |item|
        item.input :title
        item.input :image, :as => :file, hint: item.template.image_tag(item.object.image.url(:large))
      end

    end

    

    f.actions
  end


end



