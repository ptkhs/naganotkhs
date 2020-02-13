class AddColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :allquantity, :integer
    remove_column :order_details, :allquantity, :integer
  end
end
