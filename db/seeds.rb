# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying Categories..."
Category.destroy_all
puts "Destroying Users..."
User.destroy_all

puts "Creating Users"
User.create!(email: "gcampss@gmail.com", password: "123456")

puts "Creating Categories"
c_1 = Category.create!(title: "Nature")
c_1 = Category.create!(title: "Concerts")
c_1 = Category.create!(title: "Famous")
c_1 = Category.create!(title: "Moon")
c_1 = Category.create!(title: "Surf")
c_1 = Category.create!(title: "Portrait")
c_1 = Category.create!(title: "Food")

puts "..."
puts "There you go!"