class Category < ActiveRecord::Base
	has_many :products
	has_many :children, :class_name => "Category",
    	:foreign_key => "parent_id"
  	belongs_to :parent, :class_name => "Category"
  	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" } #, :default_url => "/images/:style/missing.png"
end
