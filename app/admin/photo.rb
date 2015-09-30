ActiveAdmin.register Photo do
  controller do
    belongs_to :galleries, :polymorphic => true
    belongs_to :blog_post, :polymorphic => true
  end
# belongs_to :Gallery
#  navigation_menu do
# authorized?(:manage, SomeResource) ? :photo : :restricted_menu


# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :title
      f.input :image, :as => :file

    f.actions
    end
  end
end
