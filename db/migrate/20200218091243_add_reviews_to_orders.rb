class AddReviewsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :review, :text
    add_column :orders, :star, :integer
  end
end
