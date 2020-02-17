class AddSortItemToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sort_item, :integer
  end
end
