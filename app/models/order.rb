class Order < ApplicationRecord
	has_many :order_details, dependent: :destroy
	accepts_nested_attributes_for :order_details
	has_many :items, through: :order_details, source: :item
	belongs_to :end_user
end
