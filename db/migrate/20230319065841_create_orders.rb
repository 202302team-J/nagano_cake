class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string  :ship_name
      t.string  :ship_postcord
      t.string  :ship_address
      t.integer :postage
      t.integer :charge
      t.integer :payment_method, default: 0
      t.integer :status        , default: 0
      t.timestamps
    end
  end
end
