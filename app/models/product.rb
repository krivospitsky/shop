#coding:utf-8
class Product < ActiveRecord::Base
	has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, allow_destroy:true
	belongs_to :category
	belongs_to :manufacturer
	has_many :options, :dependent => :destroy

  extend FriendlyId
  friendly_id :seo_name

  def self.search(search)
    if search
      find(:all, :conditions => ['lower(name) LIKE ?', "%#{search.downcase}%"])
    else
      find(:all)
    end
  end

  def availability
	  return 'В наличии' if count>0
	  return 'Под заказ' if count==0
	end
end
