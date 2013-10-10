#coding:utf-8
class Product < ActiveRecord::Base
	has_many :images, :dependent => :destroy
	belongs_to :category
	belongs_to :manufacturer
	has_many :options, :dependent => :destroy
	def availability
	  return 'В наличии' if count>0
	  return 'Под заказ' if count==0
	end
end
