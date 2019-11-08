ADDRESSES = ["San martin de tours 2908, Capital Federal, Buenos Aires", "Santa Fe 3336, Capital Federal, Buenos Aires, Argentina", "Santa Fe 1300, Capital Federal, Buenos Aires, Argentina", "Niceto Vega 4866, Capital Federal, Buenos Aires, Argentina"]
require 'faker'

puts 'Cleaning DB...'


ShowroomVariantStock.destroy_all
Variant.destroy_all
Product.destroy_all
Photo.destroy_all
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

nombres_marcas = ["Akiabara","Rapsodia","Vitamina", "Zara"]
logos = [
  "https://i.imgur.com/cDxvUy7.png",
  "https://i.imgur.com/IXje2Gc.png",
  "https://i.imgur.com/EJ8pgGJ.png",
  "https://i.imgur.com/TYPRRUv.png",
]


puts "creating brands"

nombres_marcas.each_with_index do |name, index|
  brand = Brand.create!(
    name: name,
    logo: logos[index],
    status: true,
    )


  3.times do
    showroom = Showroom.new(
      brand: brand,
      name: Faker::Name.first_name,
      phone_number: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email
    )
    showroom.build_address(street: ADDRESSES.sample)
    showroom.save!
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
      ["red", "blue", "yellow"].each do |color|
        variant = product.variants.build(
          color: color,
          size: ["medium","small", "large"].sample
        )
        variant.showroom_variant_stocks.build(showroom: showroom, stock: rand(0..5))
        variant.save!
      end
    end
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
  if rand(0..50) > 40
    variant = Product.where(category: bidding.category).sample.variants.sample
    purchase = Purchase.create!(
      showroom_variant_stock: ShowroomVariantStock.where(variant: variant).sample,
      bidding: bidding,
      qr: "link",
      payment_method: ["efectivo", "tarjeta"].sample,
      status: "activo"
      )
    if rand(0..50) > 40
      Payment.create!(
        purchase: purchase,
        status: "pago"
        )
    end
  end
end

puts "finished db"
