ActiveAdmin.register Gallery do
# ActiveAdmin.register Photo do
# belongs_to :photo
#  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

  permit_params :title, :body, :published, :mature, :sticky, :image, :photos_attributes => [:id, :title, :image, :_destroy]
  
  scope :all, default: true
  scope("Hidden") { |scope| scope.where(published: false) }
  scope("Published") { |scope| scope.where(published: true) }
  scope("Mature") { |scope| scope.where(mature: true) }

  controller do
    # This code is evaluated within the controller class

    def create
      @gallery = Gallery.create(permitted_params[:gallery])
      @photo = @gallery.photos.map { |p| p if p.changed?}.compact.first
      
      redirect_to admin_galleries_path(@gallery)
      # Instance method
    end
  end

  index do
    selectable_column
    column :title
    column :published
    column :mature
    column :sticky
    actions
  end

  
  show do
    attributes_table do
      row :title
      # row('Body') { |b| b.body.html_safe }
      row('Published') { |b| status_tag b.published }
      row('Mature') { |b| status_tag b.mature }
      row('Sticky') { |b| status_tag b.sticky }

      render 'gallery_show', :locals => {:gallery => gallery}
      
    end
    active_admin_comments
  end


   def update
      puts "Updating"
      puts params[:photos_attributes]
      @gallery = Gallery.find(params[:id])
      @gallery.update(permitted_params[:gallery])
      @photo = @gallery.photos.map { |p| p if p.changed?}.compact.first
      puts @gallery
      puts @photo.nil?
      redirect_to admin_galleries_path
    end
  
  
  form html: { multipart: true } do |f|
    f.actions
    f.inputs "Galleries" do 

      f.input :title
      f.input :body, input_html:{class: 'redactor'}
      f.input :published
      f.input :mature
      f.input :sticky
      f.input :gallery_images_url, :as => :file, :input_html => {:multiple => true}, name: "gallery[gallery_images_attributes][][url]"

      f.has_many :photos do |item|
        item.input :title
        item.input :image, :as => :file, hint: (item.object.new_record? ? "Add an image file" : (item.template.image_tag(item.object.image.url(:medium))))
        item.input :_destroy, :as => :boolean
      end

    end

    f.actions
  end

  form partial: 'form'  

end



 

