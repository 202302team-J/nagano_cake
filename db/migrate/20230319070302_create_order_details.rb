class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer  :order_id
      t.integer  :item_id
      t.integer  :item_count
      t.integer  :tax_price
      t.integer  :making_status, default: 0
      t.timestamps
    end
  end
end
