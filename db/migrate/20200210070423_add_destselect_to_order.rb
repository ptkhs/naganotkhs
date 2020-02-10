class AddDestselectToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :destselect, :integer
  end
end
