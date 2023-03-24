class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders
  has_many :destinations
  has_many :cart_items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # フルネームメソッド　selfはcustomerモデルのことを
  def full_name
    self.family_name + " " + self.personal_name
  end
end
