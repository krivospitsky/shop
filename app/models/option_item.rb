#coding:utf-8
class OptionItem < ActiveRecord::Base
	belongs_to :option
	def label
		if self.delta!=0
			sign=self.delta>0?'+':''
			"#{self.value} (#{sign}#{self.delta} руб.)"
		else
			self.value
		end
	end
end
