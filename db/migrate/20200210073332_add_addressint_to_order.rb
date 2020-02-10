class AddAddressintToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :addressint, :integer
  end
end
