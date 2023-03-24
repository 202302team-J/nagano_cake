class Order < ApplicationRecord
  belongs_to :customer
  has_many   :order_details
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, preparing_for_shipment: 3, shipped: 4 }

  def get_image(width,height)
     image.variant(resize_to_limit: [width,height]).processed
  end

  def add_tax_price
    (self.price*1.10).round
  end

  def subtotal
    item.add_tax_price * count
  end

end
