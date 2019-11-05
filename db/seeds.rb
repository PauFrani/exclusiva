# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning DB...'

Showroom.destroy_all
Brand.destroy_all
BrandRank.destroy_all
Bidding.destroy_all
User.destroy_all
Product.destroy_all


10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Number.number(digits: 10),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    photo: "https://randomuser.me/api/portraits/#{["man","woman"].sample}/#{rand(1..99)}.jpg",
    status: false
    )
end


users = User.all.sample

5.times do
  Bidding.create(
    amount: Faker::Number.between(from: 100, to: 10000),
    category: ["jean","pants","shirt"].sample,
    user: users
    )
end

5.times do
  Brand.create(
    name: ["GAP","AKB","NIKE"].sample,
    logo: "NADA",
    status: false
    )
end

biddings = Bidding.all.sample
brands = Brand.all.sample

5.times do
  BrandRank.create(
    order: Faker::Number.between(from: 1000, to: 9999),
    bidding_id: biddings,
    brand: brands
    )
end

5.times do
  Showroom.create(
    name: Faker::Name.first_name,
    phone_number: Faker::PhoneNumber.phone_number,
    brand: Brand.all.sample,
    email: Faker::Internet.email
    )
end

# 10.times do
#   Product.create(
#     name: ,
#     min_price: ,
#     max_price: ,
#     category: ,
#     description: ,
#     sku_ext: Faker::Number.number(digits: 15),
#     showroom: ,
#     published: false
#     )
# end

puts "finished db"
