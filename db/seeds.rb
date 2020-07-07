# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 2 gems to access any urls in seed and to generate addrsses quickly
require "open-uri"
require 'faker'

counter = 0
user_store = []

# 5.times do
#   user_file = URI.open("#{user_photos[counter]}")
#   user = User.create!(email: Faker::Internet.email, password: '123456')
#   user.photo.attach(io: user_file, filename: "#{user_filenames[counter]}", content_type: 'image/jpg')
#   flat_file = URI.open("#{flat_photos[counter]}")
#   flat = Flat.new(address: "#{address[counter]}", description: Faker::Movies::StarWars.quote, title: Faker::Address.street_address, user_id: user.id, beds: Faker::Number.within(range: 1..6), bedrooms: Faker::Number.within(range: 1..10), guests: Faker::Number.within(range: 1..10), price_per_night:Faker::Number.within(range: 50..100)  )
#   flat.photos.attach(io: flat_file, filename: "#{flat_filenames[counter]}", content_type: 'image/jpg')
#   flat.save
#   counter += 1
# end

Customer.destroy_all
User.destroy_all
puts 'creating 5 users and customers'

5.times do
  user = User.create!(email: Faker::Internet.email, password: '123456')
  user_store << user.id
end

5.times do
  customer = Customer.create!(
    user_id: user_store[counter],
    phone_number: Faker::PhoneNumber.phone_number,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name)
  counter += 1
end
