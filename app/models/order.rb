class Order < ApplicationRecord
	has_many :order_details, dependent: :destroy
	accepts_nested_attributes_for :order_details
	has_many :items, through: :order_details, source: :item
	belongs_to :end_user

	validates :zipcode, presence: true, length: { minimum: 7, maximum: 7 }, format: { with: /\A[0-9]+\z/ }
	validates :address, presence: true, length: { minimum: 7 }
	validates :name, presence: true, length: { minimum: 2 }
end
