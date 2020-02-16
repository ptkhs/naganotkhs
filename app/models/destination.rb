class Destination < ApplicationRecord
	belongs_to :end_user

	validates :zipcode, presence: true, length: { minimum: 7, maximum: 7 }, format: { with: /\A[0-9]+\z/ }
	validates :address, presence: true,length: { minimum: 7 }
	validates :name, presence: true, length: { minimum: 2 }
end
