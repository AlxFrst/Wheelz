class AddKilometersToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :kilometers, :integer
  end
end
