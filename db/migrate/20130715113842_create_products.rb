class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :discount
      t.hstore :attrs
      t.hstore :options
      t.integer :category_id
      t.text :sku
      t.integer :count
      t.boolean :hidden
      t.integer :sort
      t.integer :vendor_id
      t.text :seo_name

      t.timestamps
    end
  end
end
