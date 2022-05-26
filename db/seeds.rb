# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Car.destroy_all

require "faker"

User.create(email: "alex@alex.com", password: "azerty", first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name, street: Faker::Address.street_address, city: Faker::Address.city,
            country: Faker::Address.country, username: Faker::Esport.player, birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
            postal_code: Faker::Address.zip_code, phone: Faker::PhoneNumber.phone_number_with_country_code,
            license: true)

User.create(email: 'julien@julien.com', password: 'azerty', first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name, street: '4 avenue Foch', city: 'Paris',
  country: Faker::Address.country, username: Faker::Esport.player, birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  postal_code: Faker::Address.zip_code, phone: Faker::PhoneNumber.phone_number_with_country_code,
  license: true)

User.create(email: 'olivier@olivier.com', password: 'azerty', first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name, street: 'rue du quai', city: 'la madeleine',
  country: Faker::Address.country, username: Faker::Esport.player, birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  postal_code: Faker::Address.zip_code, phone: Faker::PhoneNumber.phone_number_with_country_code,
  license: true)

20.times do
  User.create(email: Faker::Internet.email, password: "azerty", first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name, street: "4 avenue des saules", city: "LILLE",
              country: Faker::Address.country, username: Faker::Esport.player, birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
              postal_code: Faker::Address.zip_code, phone: Faker::PhoneNumber.phone_number_with_country_code,
              license: true)
end

User.all.each do |i|
  Car.create!(brand: Faker::Vehicle.make, model: Faker::Vehicle.model, color: Faker::Vehicle.color,
              horsepower: rand(200..900), year: Faker::Vehicle.year, description: "trop cool", kilometers: Faker::Vehicle.kilometrage,
              plate: Faker::Vehicle.license_plate, energy: Faker::Vehicle.fuel_type, seats: Faker::Vehicle.door_count,
              price: rand(100..2500), user_id: i.id)
end
