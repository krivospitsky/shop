class ChangeStateType < ActiveRecord::Migration
  def change
    change_column :orders, :state, :string
  end
end
