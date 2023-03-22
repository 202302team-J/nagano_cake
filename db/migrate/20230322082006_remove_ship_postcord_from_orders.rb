class RemoveShipPostcordFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :ship_postcord, :string
  end
end
