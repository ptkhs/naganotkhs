class Item < ApplicationRecord
	attachment :image
	has_many :carts
	belongs_to :categories
end
