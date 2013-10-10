class DeleteOptionsFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :options
  end
end
