class AddColumnToOrdels < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :allquantity, :integer
  end
end
