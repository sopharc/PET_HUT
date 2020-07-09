# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 2 gems to access any urls in seed and to generate addrsses quickly
# require "open-uri"
require 'faker'

counter = 0
second_counter = 0
user_store = []
product_store =[]
customer_store = []

puts 'clearing out the cobwebs'
ProductMaterial.destroy_all
Component.destroy_all
Product.destroy_all
Address.destroy_all
Customer.destroy_all
User.destroy_all
puts 'creating 5 users and customers'
categories = ['bed', 'hammock', 'hut']

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
  customer_store << customer.id
  counter += 1
end

puts 'giving the customers somehwere to live'
5.times do
  address = Address.create!(first_line: Faker::Address.building_number,
    second_line: Faker::Address.street_address,
    postcode: Faker::Address.zip_code,
    customer_id: customer_store[second_counter] )
    second_counter += 1
end

puts 'making the products, the elves might take a while...'
5.times do
  product = Product.create!(name: Faker::Games::WarhammerFantasy.hero,
    category: categories[rand(0..2).round],
    price: rand(10.3..50.7).round(2),
    description: Faker::Movies::Ghostbusters.quote,
    dimensions: "#{rand(10..50)}x#{rand(10..50)}x#{rand(10..50)}"
    )
  product_store << product.id
end

red_cloth = Component.create( colour: 'red', material: 'hessian', name: 'red cloth', stock_quantity: 4)
blue_cloth = Component.create( colour: 'blue', material: 'linen', name: 'blue cloth', stock_quantity: 2)
dark_wood = Component.create( colour: 'dark brown', material: 'pretend wood', name: 'dark wood', stock_quantity: 15)
light_wood = Component.create( colour: 'light brown', material: 'pretend wood', name: 'light wood', stock_quantity: 12)

thing1 = ProductMaterial.create( product_id: product_store[0], component_id: red_cloth.id)
thing1b = ProductMaterial.create( product_id: product_store[0], component_id: light_wood.id)
thing2 = ProductMaterial.create( product_id: product_store[1], component_id: blue_cloth.id)
thing2b = ProductMaterial.create( product_id: product_store[1], component_id: dark_wood.id)
