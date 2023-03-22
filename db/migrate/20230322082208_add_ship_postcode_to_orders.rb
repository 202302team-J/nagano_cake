class AddShipPostcodeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :ship_postcode, :string
  end
end
