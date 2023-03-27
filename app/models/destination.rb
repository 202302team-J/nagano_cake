class Destination < ApplicationRecord
  belongs_to :customer

  validates :address, presence: true
  validates :postcode, presence: true
  validates :name, presence: true

  def address_display
    '〒' + postcode.to_s + ' ' + address.to_s + ' ' + name.to_s
  end

end