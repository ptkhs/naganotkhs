class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories, :id => false do |t|
      t.integer :id, :primary_key => true
      t.boolean :available
      t.string :name

      t.timestamps
    end
  end
end
