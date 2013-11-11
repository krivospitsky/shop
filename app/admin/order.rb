#coding:utf-8

ActiveAdmin.register Order do
   state_action :processing
   state_action :processed
   state_action :reject

  form do |f|

  end

  actions :all, except: [:show]

controller do
      # don't show the "New" button on the index page
      def action_methods
         super << 'reject'
      end
end
  index do
    column :id do |order|
      link_to order.id, edit_admin_order_path(order)
    end
    column:state
    column :name
    column :email
    column :phone
    column :city
    column :address
    column :comment
    actions
    # actions defaults: true do  |order|
    #   link_to('Отменить', reject_admin_order_path(order), method: :put) if order.can_reject?
    # end
    # actions defaults: true do  |order|
    #   link_to('Завершить', processed_admin_order_path(order), method: :put) if order.can_processed?
    # end
    # actions defaults: true do  |order|
    #   link_to('В работу', processing_admin_order_path(order), method: :put) if order.can_processing?
    # end
  end

end
