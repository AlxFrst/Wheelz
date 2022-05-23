class AddRatingToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :rating, :integer, default: 0
  end
end
