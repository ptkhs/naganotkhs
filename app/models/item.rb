class Item < ApplicationRecord
	attachment :image
	has_many :carts
	belongs_to :end_users
end
