class RenameVendorOnProducts < ActiveRecord::Migration
  def change
	rename_column :products, :vendor_id, :manufacturer_id
  end
end
