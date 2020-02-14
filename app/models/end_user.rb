class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts, dependent: :destroy
  has_many :cart_items, through: :carts, source: :item
  has_many :destinations, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :lastname, length: { minimum: 1, maximum: 10 }
  validates :firstname, length: { minimum: 1, maximum: 10 }
  validates :firstname_kana, length: { minimum: 1, maximum: 15 }, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :lastname_kana, length: { minimum: 1, maximum: 15 }, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :zipcode, length: { minimum: 7, maximum: 7 }, format: { with: /\A[0-9]+\z/ }
  validates :address, length: { minimum: 7 }
  validates :phone_number, format: { with: /\A[0-9]+\z/ }
  def self.search(search)
      return EndUser.all unless search
      EndUser.where(['lastname LIKE ? OR firstname LIKE ? OR lastname_kana LIKE ? OR firstname_kana LIKE ?', "%#{search}%",  "%#{search}%",  "%#{search}%",  "%#{search}%"])
  end
end
