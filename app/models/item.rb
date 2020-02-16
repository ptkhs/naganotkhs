class Item < ApplicationRecord
	attachment :image
	belongs_to :category
	has_many :carts, dependent: :destroy
	has_many :orders, through: :order_details, source: :order
	validates :price, numericality: { only_integer: true, greater_than: 0}
	def self.search(search)
      return Item.all unless search
      Item.where(['name LIKE ?', "%#{search}%"])
  end
end
