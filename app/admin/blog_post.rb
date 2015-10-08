ActiveAdmin.register BlogPost do
 # default_fields :title, :body  


  permit_params :title, :body, :date, :published, :image, :photos_attributes => [:id, :title, :image]

  scope :all, default: true
  scope("Hidden") { |scope| scope.where(published: false) }
  scope("Published") { |scope| scope.where(published: true) }

  form do |f|
    f.inputs "Blog Post" do 
      f.input :title
      f.input :published
      f.input :body, input_html:{class: 'redactor'}
      f.input :image, :as => :file

      # f.has_many :photos do |item|
      #   item.input :title
      #   item.input :image, :as => :file
      # end

    end

    f.actions
  end




  show do
    
    attributes_table do
      row :title
      row :created_at
      row('Published?') { |b| status_tag b.published }
    end

    panel "Post Image" do
      image_tag blog_post.image.url(:large)
    end

    panel "Body" do
      blog_post.body.html_safe
    end
    
  end



end
