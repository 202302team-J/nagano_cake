class Destination < ApplicationRecord
  belongs_to :customer


  def address_display
    '〒' + postcode.to_s + ' ' + address.to_s + ' ' + name.to_s
  end

end