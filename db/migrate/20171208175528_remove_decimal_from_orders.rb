class RemoveDecimalFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :decimal, :string
  end
end
