class BlogPost < ActiveRecord::Base

  has_many :photos, :as => :owner, :dependent => :destroy
  accepts_nested_attributes_for :photos
end
