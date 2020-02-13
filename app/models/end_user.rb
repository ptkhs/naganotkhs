class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts, dependent: :destroy
  has_many :cart_items, through: :carts, source: :item
  has_many :destinations, dependent: :destroy
  has_many :orders, dependent: :destroy
  def self.search(search)
      return EndUser.all unless search
      EndUser.where(['lastname LIKE ? OR firstname LIKE ? OR lastname_kana LIKE ? OR firstname_kana LIKE ?', "%#{search}%",  "%#{search}%",  "%#{search}%",  "%#{search}%"])
   end
end
