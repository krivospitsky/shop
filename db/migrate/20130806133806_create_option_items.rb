class CreateOptionItems < ActiveRecord::Migration
  def change
    create_table :option_items do |t|
      t.string :value
      t.integer :option_id
      t.integer :delta

      t.timestamps
    end
  end
end
