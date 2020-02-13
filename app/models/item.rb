class Item < ApplicationRecord
	attachment :image
	belongs_to :category
	has_many :carts, dependent: :destroy
	has_many :orders, through: :order_details, source: :order
end
