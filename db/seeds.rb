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
        category: ["shoes", "dress", "shirts", "jeans", "shorts", "accessories"].sample,
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

puts "Adding photos to products"
photo_collections = [["https://static.zara.net/photos///2019/I/0/1/p/5899/169/407/2/w/1920/5899169407_1_1_1.jpg?ts=1573241376830",
        "https://static.zara.net/photos///2019/I/0/1/p/5899/169/407/2/w/1920/5899169407_2_1_1.jpg?ts=1573241405443",
        "https://static.zara.net/photos///2019/I/0/1/p/5899/169/407/2/w/1920/5899169407_2_2_1.jpg?ts=1573241405445",
        "https://static.zara.net/photos///2019/I/0/1/p/5899/169/407/2/w/1920/5899169407_2_4_1.jpg?ts=1573241398721",
        "https://static.zara.net/photos///2019/I/0/1/p/5899/169/407/2/w/1920/5899169407_6_1_1.jpg?ts=1568129396974"
        ],
        [
          "https://static.zara.net/photos///2019/I/M/1/p/0000/005/273/2/cb-0-0-4176-3072-Center/w/1920/0000005273_1_1_1.jpg?ts=1573228370250",
          "https://static.zara.net/photos///2019/I/0/1/p/1856/300/808/2/w/1920/1856300808_1_1_1.jpg?ts=1573207337103",
          "https://static.zara.net/photos///2019/I/0/1/p/1856/300/808/2/w/1920/1856300808_2_1_1.jpg?ts=1573207373696"
        ],
        [
          "https://static.zara.net/photos///2019/I/2/1/p/0110/146/999/2/w/1920/0110146999_1_1_1.jpg?ts=1571844884435",
          "https://static.zara.net/photos///2019/I/2/1/p/0110/146/999/2/w/1920/0110146999_2_2_1.jpg?ts=1572544939565",
          "https://static.zara.net/photos///2019/I/2/1/p/0110/146/999/2/w/1920/0110146999_2_1_1.jpg?ts=1572544944749"
        ],
        [
          "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_2_1_1.jpg?ts=1573030070793",
          "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_2_3_1.jpg?ts=1573030071626",
          "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_2_4_1.jpg?ts=1573030078976",
          "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_2_5_1.jpg?ts=1573030084560",
          "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_2_6_1.jpg?ts=1573030092960",
          "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_6_1_1.jpg?ts=1567589993052"
        ],
        [
          "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_1_1_1.jpg?ts=1571758747574",
          "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_6_1_1.jpg?ts=1571758761312",
          "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_2_3_1.jpg?ts=1571758793458",
          "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_2_4_1.jpg?ts=1571758767779",
          "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_2_5_1.jpg?ts=1571758767161",
          "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_2_6_1.jpg?ts=1571758773463"
        ],
        [
          "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_2_1_1.jpg?ts=1572515125513",
          "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_1_1_1.jpg?ts=1572515058878",
          "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_2_2_1.jpg?ts=1572515158249",
          "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_2_3_1.jpg?ts=1572515191338",
          "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_2_4_1.jpg?ts=1572518392909",
          "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_2_15_1.jpg?ts=1573057207747"
        ],
        [
          "https://static.zara.net/photos///2019/I/0/1/p/2157/263/600/2/w/1920/2157263600_1_1_1.jpg?ts=1573232689677",
          "https://static.zara.net/photos///2019/I/0/1/p/2157/263/600/2/w/1920/2157263600_2_2_1.jpg?ts=1573232728735",
          "https://static.zara.net/photos///2019/I/0/1/p/2157/263/600/2/w/1920/2157263600_2_1_1.jpg?ts=1573233131671",
          "https://static.zara.net/photos///2019/I/0/1/p/2157/263/600/2/w/1920/2157263600_2_4_1.jpg?ts=1573232715255",
          "https://static.zara.net/photos///2019/I/0/1/p/2157/263/600/2/w/1920/2157263600_6_1_1.jpg?ts=1573062036320"
        ]
      ]
Product.all.each do |prod|
  photo_collections.sample.each do |photo_url|
    p = Photo.new(url_photo: photo_url)
    p.product = prod
    p.save!
    puts "Photo created"
  end
end

5.times do
  Bidding.create(
    amount: Faker::Number.between(from: 100, to: 10000),
    category: ["shoes", "dress", "shirts", "jeans", "shorts", "accessories"].sample,
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








