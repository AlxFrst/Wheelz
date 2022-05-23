class RenameCarKilometers < ActiveRecord::Migration[6.1]
  def change
    rename_column :cars, :killometers, :kilometers
  end
end
