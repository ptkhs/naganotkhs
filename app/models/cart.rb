class Cart < ApplicationRecord

belongs_to :end_user
belongs_to :item
validates :item_quantity, numericality: {only_integer: true, greater_than_or_equal_to: 1}


end


