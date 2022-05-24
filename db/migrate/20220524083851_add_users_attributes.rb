class AddUsersAttributes < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :birthday, :date
    add_column :users, :postal_code, :string
    add_column :users, :phone, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :license, :boolean
  end
end
