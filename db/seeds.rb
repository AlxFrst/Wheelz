# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

20.times do
  User.create(email: Faker::Internet.email, password: 'azerty', city: )
end

User.all.each do |i|
  Car.create!(brand: Faker::Vehicle.make, model:Faker::Vehicle.model, color: Faker::Vehicle.color,
    horsepower: rand(200..900), year:Faker::Vehicle.year, kilometers:Faker::Vehicle.kilometrage,
    plate:Faker::Vehicle.license_plate, energy:Faker::Vehicle.fuel_type, seats:Faker::Vehicle.door_count,
    user_id: i.id)
end
