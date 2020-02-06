class AddXxxToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :lastname, :string
    add_column :end_users, :firstname, :string
    add_column :end_users, :lastname_kana, :string
    add_column :end_users, :firstname_kana, :string
    add_column :end_users, :zipcode, :string
    add_column :end_users, :address, :string
    add_column :end_users, :phone_number, :string
    add_column :end_users, :status, :boolean
  end
end
