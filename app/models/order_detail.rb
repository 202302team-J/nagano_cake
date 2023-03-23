class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { no_production: 0,
                        waiting_production: 1,
                        in_production: 2,
                        completion_production: 3
  }
  
  def subtotal
    tax_price * item_count
  end
end
