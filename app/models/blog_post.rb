class BlogPost < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :large => "1140x705#" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_many :photos, :as => :owner, :dependent => :destroy
  accepts_nested_attributes_for :photos
end
