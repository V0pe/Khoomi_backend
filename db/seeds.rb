# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_1 = User.create(first_name: 'GlumpPunk09', last_name: 'dam', country: 'USA', date_of_birth: '07 Aug 2002 21:20:49.262680000')
# user_2 = User.create(first_name: 'BillyBoy10')

item_1 = Item.create(name: 'Air force', color: 'red', brand: "nike", category: 'Shoe', price: 110.0)
item_1.image.attach(io: File.open("app/assets/images/shoe-1.png"), filename: "Nike shoe")
item_2 = Item.create(name: 'Air force 2', color: 'blue', brand: "nike", category: 'Shoe', price: 220.0)
item_2.image.attach(io: File.open("app/assets/images/shoe-2.png"), filename: "Nike shoe")
item_3 = Item.create(name: 'Air force 3', color: 'yellow', brand: "nike", category: 'Shoe', price: 330.0)
item_3.image.attach(io: File.open("app/assets/images/shoe-3.png"), filename: "Nike shoe")
item_4 = Item.create(name: 'Air force 4', color: 'red', brand: "nike", category: 'Shoe', price: 440.0)
item_4.image.attach(io: File.open("app/assets/images/shoe-4.png"), filename: "Nike shoe")

