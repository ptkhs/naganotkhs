class Item < ApplicationRecord
	attachment :image
	belongs_to :category
	has_many :carts, dependent: :destroy
end
