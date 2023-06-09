class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :count, presence: true


  def add_tax_price
  (item.price * 1.10).round
  end

  def subtotal
    item.add_tax_price * count.to_i
  end


end
