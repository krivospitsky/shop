class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
	add_attachment :manufacturers, :image
  end
end
