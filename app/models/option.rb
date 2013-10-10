class Option < ActiveRecord::Base
	belongs_to :product
	has_many :option_items, :dependent => :destroy
end
