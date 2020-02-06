class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :end_user_id
      t.integer :item_id
      t.integer :item_quantity

      t.timestamps
    end
  end
end
