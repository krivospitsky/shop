class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :product_id
      t.integer :order
      t.timestamps
    end
  end
end
