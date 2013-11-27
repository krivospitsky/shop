#coding:utf-8

ActiveAdmin.register Order do
  state_action :processing
  state_action :processed
  state_action :reject

  actions :all, except: [:show]

  index do
    column :id do |order|
      link_to order.id, edit_admin_order_path(order)
    end
    column :state
    column :name
    column :email
    column :phone
    column :city
    column :address
    column :comment
    actions defaults: true do  |order|
      links = ''.html_safe
      links += link_to('Отменить', reject_admin_order_path(order), method: :put, class:'member_link') if order.can_reject?
      links += link_to('Завершить', processed_admin_order_path(order), method: :put, class:'member_link') if order.can_processed?
      links += link_to('В работу', processing_admin_order_path(order), method: :put, class:'member_link') if order.can_processing?
      links
    end
  end


#form :partial => 'form'
  form do |f|
    f.inputs do
      f.input :state
      f.input :name
      f.input :email
      f.input :phone
      f.input :city
      f.input :address
      f.input :comment
    end
    f.inputs "Товары" do
      f.has_many :cart_items, allow_destroy: true, new_record: true do |cf|
        cf.input :id, as: :hidden
        cf.input :product
        cf.input :quantity
      end
      # f.actions defaults: true do  |order|
      #   links = ''.html_safe
      #   links += link_to('Отменить', reject_admin_order_path(f.object), method: :put, class:'member_link') if f.object.can_reject?
      #   links += link_to('Завершить', processed_admin_order_path(f.object), method: :put, class:'member_link') if f.object.can_processed?
      #   links += link_to('В работу', processing_admin_order_path(f.object), method: :put, class:'member_link') if f.object.can_processing?
      #   links
      # end
    end
    f.actions
  end

  #   end
  # end
  #   f.inputs do
  #     f.object.order_items.each do |oi|
  #       text_node    oi.product
  #     end
  #   end
  #   # table_for order.order_items do
  #   #   column 'Товар', :product
  #   #   column 'Количество', :quantity
  #   # end
  # end
  controller do
    def permitted_params
      params.permit order: [:name, cart_items_attributes: [:id, :quantity, :product_id, :_destroy]]
    end
  end
end
