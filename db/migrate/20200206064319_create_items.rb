class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, :id => false do |t|
      t.integer :id, :primary_key => true
      t.integer :category_id
      t.string :name
      t.integer :price
      t.text :discription
      t.string :image_id
      t.boolean :status

      t.timestamps
    end
  end
end
