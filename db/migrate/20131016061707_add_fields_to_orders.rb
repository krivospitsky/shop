class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :name, :string
    add_column :orders, :email, :string
    add_column :orders, :phone, :string
    add_column :orders, :zip, :string
    add_column :orders, :city, :string
    add_column :orders, :address, :string
    add_column :orders, :comment, :string
  end
end
