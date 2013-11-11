#coding:utf-8
class Order < ActiveRecord::Base
  belongs_to :cart
  state_machine :state, :initial => :Новый do
    event :processing do
      transition :Новый => :Обработка
    end
    event :processed do
      transition :Обработка => :Выполнен
    end
    event :reject do
      transition any - :Отменен => :Отменен
    end
  end
end
