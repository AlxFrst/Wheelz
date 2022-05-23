class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :horsepower
      t.integer :year
      t.integer :killometers
      t.string :plate
      t.string :energy
      t.integer :seats
      t.boolean :smoker
      t.boolean :animals
      t.string :color
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
