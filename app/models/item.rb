class Item < ApplicationRecord
	attachment :image
	belongs_to :categories
	has_many :carts, dependent: :destroy
end
