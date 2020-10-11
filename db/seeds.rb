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
Order.destroy_all
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
    price_cents: rand(100..500),
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

blog1 = BlogPost.create(title: "Blog Post 1", content: "I love cheese, especially mozzarella macaroni cheese. The big cheese red leicester mozzarella stilton mascarpone bavarian bergkase rubber cheese bocconcini. Cheese triangles manchego camembert de normandie croque monsieur feta cheesy grin cottage cheese say cheese. Fromage frais cut the cheese cheddar mozzarella smelly cheese stinking bishop goat halloumi. Edam roquefort the big cheese cow the big cheese caerphilly blue castello cheese strings. Smelly cheese blue castello chalk and cheese cheese triangles who moved my cheese brie boursin taleggio. Boursin say cheese fondue cream cheese melted cheese brie emmental mascarpone. Roquefort bocconcini gouda cauliflower cheese cheeseburger the big cheese smelly cheese camembert de normandie. The big cheese danish fontina jarlsberg mozzarella cheese and biscuits cheesecake melted cheese stilton. Port-salut cheese and biscuits chalk and cheese st. agur blue cheese emmental smelly cheese mozzarella chalk and cheese. Bocconcini the big cheese cauliflower cheese jarlsberg hard cheese blue castello st. agur blue cheese cheeseburger. Gouda st. agur blue cheese boursin.")
blog2 = BlogPost.create(title: "Blog Post 2", content: "Queso paneer brie. Jarlsberg rubber cheese fromage danish fontina stilton cheese strings paneer cheese and wine. Airedale dolcelatte squirty cheese goat cut the cheese cheese and wine manchego taleggio. Red leicester who moved my cheese cut the cheese pecorino croque monsieur caerphilly cheese and wine port-salut. Babybel macaroni cheese babybel pepper jack cheesy feet roquefort cheesy feet manchego. Monterey jack the big cheese cheesy feet cream cheese cheese and wine halloumi say cheese chalk and cheese. Bocconcini gouda cut the cheese roquefort roquefort caerphilly paneer brie. Emmental queso feta the big cheese dolcelatte mozzarella cream cheese who moved my cheese. When the cheese comes out everybody's happy boursin mascarpone cow stilton ricotta hard cheese cheese and biscuits. Queso brie cheese slices cheese on toast dolcelatte roquefort mozzarella cheese on toast. Port-salut airedale lancashire boursin halloumi boursin.")
blog3 = BlogPost.create(title: "Blog Post 3", content: "Camembert de normandie danish fontina dolcelatte. Pepper jack cut the cheese who moved my cheese danish fontina goat camembert de normandie melted cheese who moved my cheese. Cheese slices roquefort cheese triangles feta cheese strings fromage frais mozzarella swiss. Cauliflower cheese boursin port-salut emmental melted cheese red leicester brie jarlsberg. Pecorino lancashire chalk and cheese stilton edam blue castello lancashire halloumi. Cheese strings feta squirty cheese chalk and cheese chalk and cheese rubber cheese pepper jack cheese strings. Cheeseburger queso cheese on toast roquefort edam caerphilly everyone loves parmesan. Gouda fromage frais cheese and biscuits cheesy feet stinking bishop fromage cheese on toast bavarian bergkase. Swiss port-salut stilton rubber cheese cream cheese cheese slices squirty cheese fondue. Blue castello brie port-salut babybel port-salut cow ricotta port-salut. Smelly cheese smelly cheese cheeseburger cheese slices stinking bishop mozzarella macaroni cheese cheesy grin. Airedale hard cheese swiss.")
blog4 = BlogPost.create(title: "Blog Post 4", content: "Danish fontina macaroni cheese cottage cheese. Taleggio mozzarella say cheese dolcelatte cauliflower cheese cheeseburger bocconcini brie. Queso cheese and wine pepper jack cut the cheese fondue chalk and cheese camembert de normandie cauliflower cheese. Bavarian bergkase parmesan emmental hard cheese gouda pecorino boursin fondue. Stinking bishop cream cheese cheddar fromage emmental fromage frais cheese and wine babybel. Cheeseburger chalk and cheese camembert de normandie the big cheese airedale cheese strings boursin babybel. Paneer roquefort pepper jack cheese and biscuits mozzarella squirty cheese lancashire fromage frais. When the cheese comes out everybody's happy hard cheese cut the cheese cheese on toast stilton red leicester pecorino croque monsieur. Parmesan swiss cheesecake hard cheese babybel everyone loves edam monterey jack. Chalk and cheese macaroni cheese cheesy feet st. agur blue cheese mozzarella cauliflower cheese when the cheese comes out everybody's happy.")
blog5 = BlogPost.create(title: "Blog Post 5", content: "Macaroni cheese babybel everyone loves. Cheesecake everyone loves st. agur blue cheese boursin who moved my cheese croque monsieur swiss melted cheese. Smelly cheese emmental macaroni cheese pecorino cheesy grin cheese on toast cheese and biscuits everyone loves. Cream cheese dolcelatte lancashire melted cheese the big cheese cheese on toast fondue ricotta. Cow cauliflower cheese mascarpone taleggio cheeseburger cheesy feet brie queso. Paneer airedale boursin cheese on toast gouda macaroni cheese boursin taleggio. Chalk and cheese parmesan mascarpone babybel red leicester chalk and cheese gouda chalk and cheese. Cottage cheese who moved my cheese cheese and wine monterey jack cream cheese halloumi cheesy grin babybel. Cheese triangles cheese slices goat pecorino parmesan everyone loves smelly cheese cut the cheese. Cut the cheese halloumi port-salut who moved my cheese cow who moved my cheese the big cheese bocconcini. Brie gouda swiss danish fontina.")
