class Photo < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true                   

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :large => "1140x705#" }
  
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates :owner, presence: true
end
