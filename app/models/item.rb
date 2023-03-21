class Item < ApplicationRecord
  belongs_to :genre
  has_many   :order_details
  has_many   :cart_item
  has_one_attached :image


  def get_image(width,height)
      image.variant(resize_to_limit: [width,height]).processed
  end

  #税込み価格を表示するための記述です。
  #add_tax_(消費税を計算したいカラム名)
  def add_tax_price
  (self.price * 1.10).round
  end


end
