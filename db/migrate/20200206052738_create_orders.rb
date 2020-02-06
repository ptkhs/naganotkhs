class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :paymethod
      t.string :zipcode
      t.string :address
      t.string :name
      t.integer :charge
      t.integer :status
      t.integer :fee

      t.timestamps
    end
  end
end
