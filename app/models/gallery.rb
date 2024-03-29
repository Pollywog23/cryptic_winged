class Gallery < ActiveRecord::Base
  
  has_many :photos, :as => :owner, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true
  
end
