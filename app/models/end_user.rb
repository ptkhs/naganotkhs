class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts, dependent: :destroy
  has_many :cart_items, through: :carts, source: :item
  has_many :destinations, dependent: :destroy
  has_many :orders, dependent: :destroy

end
