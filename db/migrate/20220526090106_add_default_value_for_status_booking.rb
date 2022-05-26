class AddDefaultValueForStatusBooking < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :status, 'pending_payment'
  end
end
