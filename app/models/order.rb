class Order < ApplicationRecord
	has_many :order_details, dependent: :destroy
	has_many :items, through: :order_details, source: :item
	belongs_to :end_user
end
