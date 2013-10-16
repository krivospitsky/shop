#coding:utf-8
class UserMailer < ActionMailer::Base
  default :delivery_method => 'sendmail'
  def order_confirmation(order)
    @order=order
    mail(to:order.email, subject:"Подтверждение заказа", from:"order@cargadget.ru")
    mail(to:"order@cargadget.ru", subject:"Новый заказ", from:order.email)
  end
end
