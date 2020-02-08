class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.integer :end_user_id
      t.string :address
      t.string :name
      t.string :zipcode

      t.timestamps
    end
  end
end
