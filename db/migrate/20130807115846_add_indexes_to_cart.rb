class AddIndexesToCart < ActiveRecord::Migration
  def change
	add_index :cart_items, [:product_id, :cart_id]
  end
end
