class UpdateStatusDefaultToAvailableCars < ActiveRecord::Migration[6.1]
  def change
    change_column_default :cars, :status, 'available'
  end
end
