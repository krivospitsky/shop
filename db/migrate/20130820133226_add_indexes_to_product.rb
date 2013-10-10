class AddIndexesToProduct < ActiveRecord::Migration
  def change
	add_index :products, [:category_id, :hidden]
	add_index :products, [:hidden]
  end
end
