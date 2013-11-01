class ChangeSeoNameType < ActiveRecord::Migration
  def change
    change_column :categories, :seo_name, :string
    change_column :products, :seo_name, :string
  end
end
