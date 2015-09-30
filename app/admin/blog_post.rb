ActiveAdmin.register BlogPost do
 # before_filter :apply_pagination


  permit_params :title, :body, :date, :photos_attributes => [:id, :title, :image]


    form do |f|
      f.inputs "Blog Post" do 
        f.input :title
        f.input :body
        f.input :date
        
        f.has_many :photos do |item|
          item.input :title
          item.input :image, :as => :file
        end

      end

      f.actions
    end



end
