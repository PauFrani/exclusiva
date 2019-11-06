require 'faker'

puts 'Cleaning DB...'

ProductItem.destroy_all
Product.destroy_all
Photo.destroy_all
Variant.destroy_all
Brand.destroy_all
Showroom.destroy_all
Payment.destroy_all
Purchase.destroy_all
Bidding.destroy_all
BrandRank.destroy_all

User.destroy_all

puts "creating users"
10.times do
  User.create!(
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

puts "creating brands"
5.times do
  brand = Brand.create!(
    name: ["GAP","AKB","NIKE"].sample,
    logo: "NADA",
    status: true
    )
  3.times do
    puts "create associated showroom"
    showroom = Showroom.new(
      brand: brand,
      name: Faker::Name.first_name,
      phone_number: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email
    )
    showroom.save!
    puts "create associated products"
    10.times do
      product = Product.create!(
        name: Faker::Name.first_name,
        min_price: Faker::Number.between(from: 100, to: 4999),
        max_price: Faker::Number.between(from: 5000, to: 9999),
        category: Product::CATEGORIES.sample,
        description: "Long description of a product. Length aprox 1000 char? " ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false
        )
      product_item = ProductItem.new(product: product, showroom: showroom, stock: rand(0..5))
    end
  end
end



puts "creating products variants"
Product.all.each do |product|
5.times do
  Variant.create(
    color: ["red", "blue", "yellow"].sample,
    size: ["medium","small", "large"].sample,
    product: product
    )
  end
end





5.times do
  Bidding.create(
    amount: Faker::Number.between(from: 100, to: 10000),
    category: Product::CATEGORIES.sample,
    user: User.all.sample
    )
end

Bidding.all.each do |bidding|
  brands = Brand.all
  sorting = (1..brands.size).to_a.shuffle!
  brands.each do |brand|
    bidding.brand_ranks.build(
      order: sorting.pop,
      brand: brand).save!
  end
end



puts "finished db"
