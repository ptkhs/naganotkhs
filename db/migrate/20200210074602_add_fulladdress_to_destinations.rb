class AddFulladdressToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :fulladdress, :string
  end
end
