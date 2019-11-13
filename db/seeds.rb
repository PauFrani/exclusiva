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

ADDRESSES = [
  "San martin de tours 2908, Capital Federal, Buenos Aires",
  "Santa Fe 3336, Capital Federal, Buenos Aires, Argentina",
  "Santa Fe 1300, Capital Federal, Buenos Aires, Argentina",
  "Niceto Vega 4866, Capital Federal, Buenos Aires, Argentina",
  "Gurruchaga 2401, Capital Federal, Buenos Aires, Argentina",
  "Av. Santa Fe 1860, Capital Federal, Buenos Aires, Argentina",
  "Av. Cnel. Díaz 1717, Capital Federal, Buenos Aires, Argentina",
  "Tte. Gral. Eustaquio Frías 200, Capital Federal, Buenos Aires, Argentina",
  "Av. Forest 1300, Capital Federal, Buenos Aires, Argentina"
]

USERS = [
  {
    email: "oscar.d.rodas@gmail.com",
    password: 123456,
    first_name: "Oscar",
    last_name: "Rodas",
    phone_number: 59177099978,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    photo: "https://scontent.faep8-1.fna.fbcdn.net/v/t1.0-1/p320x320/70608581_10156361030121237_8761736535130243072_n.jpg?_nc_cat=103&_nc_oc=AQkEhOmd_TrERxTddYWjnfp7clKeKnm8bbEO5P9921hVG1I4xEAJ1_TOxnjoMIq_lkI&_nc_ht=scontent.faep8-1.fna&oh=ebadb6b47dcd51aab1a8959d3ab44f68&oe=5E8CA606",
    status: true
  },
  {
    email: "lindamse@gmail.com",
    password: 123456,
    first_name: "Linda",
    last_name: "Mollinedo",
    phone_number: Faker::PhoneNumber.phone_number,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    photo: "https://avatars3.githubusercontent.com/u/54606835?v=4",
    status: true
  },
  {
    email: "marcomolin45@gmail.com",
    password: 123456,
    first_name: "Marco",
    last_name: "Molin",
    phone_number: Faker::PhoneNumber.phone_number,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    photo: "https://avatars2.githubusercontent.com/u/54744328?v=4",
    status: true
  },
  {
    email: "pfranichevich94@gmail.com",
    password: 123456,
    first_name: "Paula",
    last_name: "Franichevich",
    phone_number: Faker::PhoneNumber.phone_number,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    photo: "https://avatars3.githubusercontent.com/u/54917390?v=4",
    status: true
  },
  {
    email: "nicolaskennedy@hotmial.com",
    password: 123456,
    first_name: "Paula",
    last_name: "Franichevich",
    phone_number: Faker::PhoneNumber.phone_number,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/jjnpprepy6ktoh1afgdz.jpg",
    status: true
  }
]

puts "creating users"

USERS.each do |user|
  User.create!(user)
end


BRANDS = [
  {
    name: "Akiabara",
    logo: "https://i.imgur.com/cDxvUy7.png",
    status: true,
    showrooms: [
      {
        name: "Gurruchaga",
        phone_number: "111111111",
        email: "nico@jot.com",
        address: "San martin de tours 2908, Capital Federal, Buenos Aires"
      },
      {
        name: "Palermo",
        phone_number: "2222222",
        email: "juan@gmail.com",
        address: "Niceto Vega 4866, Capital Federal, Buenos Aires, Argentina"
      }
    ],
    products: [
      {
        name: "Saco Waters",
        min_price: 2000,
        max_price: 2500,
        category: "shirts",
        description: "Saco Azul Akiabara Waters" ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://dafitistaticar-a.akamaihd.net/p/akiabara-0967-383183-1-zoom.jpg",
          "https://dafitistaticar-a.akamaihd.net/p/akiabara-0968-383183-2-zoom.jpg",
          "https://dafitistaticar-a.akamaihd.net/p/akiabara-0969-383183-3-zoom.jpg",
          "https://dafitistaticar-a.akamaihd.net/p/akiabara-0971-383183-4-zoom.jpg"
        ],
        variants: [
          {
            color: "#596681",
            size: "38"
          },
          {
            color: "#596681",
            size: "40"
          },
        ]
      }
    ]
  }
]


nombres_marcas = ["Akiabara","Rapsodia","Vitamina", "Zara", "Kosiuko", "Kevingston", "Levi's", "Awada"]
logos = [
  "https://i.imgur.com/cDxvUy7.png",
  "https://i.imgur.com/IXje2Gc.png",
  "https://i.imgur.com/EJ8pgGJ.png",
  "https://i.imgur.com/TYPRRUv.png",
  "https://i.ibb.co/dBpL8k9/Logo-kosiuko.png",
  "https://i.ibb.co/tzTscSL/levis.png",
  "https://i.ibb.co/9r4QYMW/kevingston.png",
  "https://i.ibb.co/xSThnXT/Awada.png",
]



puts "creating brands"

BRANDS.each do |brand_data|
  brand = Brand.create!(
    name: brand_data[:name],
    logo: brand_data[:logo],
    status: brand_data[:status]
    )
  brand_data[:showrooms].each do |showroom_data|
    showroom = Showroom.new(
      brand: brand,
      name: showroom_data[:name],
      phone_number: showroom_data[:phone_number],
      email: showroom_data[:email],
    )
    showroom.build_address(street: showroom_data[:address])
    showroom.save!
    brand_data[:products].each do |product_data|
      product = Product.create!(
        name: product_data[:name],
        min_price: product_data[:min_price],
        max_price: product_data[:max_price],
        category: product_data[:category],
        description: product_data[:description],
        sku_ext: Faker::Number.number(digits: 15),
        published: product_data[:published]
      )
      product_data[:variants].each do |variant_data|
        variant = product.variants.build(
          color: variant_data[:color],
          size: variant_data[:size]
        )
        variant.showroom_variant_stocks.build(
          showroom: showroom,
          stock: rand(0..5)
        )
        variant.save!
      end
      product_data[:photos].each do |photo_url|
        p = Photo.new(url_photo: photo_url)
        p.product = product
        p.save!
      end
    end
  end

end



# variant.showroom_variant_stocks.build(showroom: showroom, stock: 3)
# variant.save!

# ["https://dafitistaticar-a.akamaihd.net/p/akiabara-0967-383183-1-zoom.jpg",
#   "https://dafitistaticar-a.akamaihd.net/p/akiabara-0968-383183-2-zoom.jpg",
#   "https://dafitistaticar-a.akamaihd.net/p/akiabara-0969-383183-3-zoom.jpg",
#   "https://dafitistaticar-a.akamaihd.net/p/akiabara-0971-383183-4-zoom.jpg"].each do |photo_url|
#   p = Photo.new(url_photo: photo_url)
#   p.product = product
#   p.save!
# end

# product = Product.create!(
#   name: "Blazer",
#   min_price: 5000,
#   max_price: 7000,
#   category: "shirt",
#   description: "Akiabara Blazer Saco Corderoy Negro" ,
#   sku_ext: Faker::Number.number(digits: 15),
#   published: false
# )
# variant = product.variants.build(
#   color: " #000000",
#   size:  "40"
# )
#     ["https://http2.mlstatic.com/akiabara-blazer-saco-corderoy-negro-s-egratis-cuotas-sint-D_NQ_NP_947054-MLA31591096777_072019-F.webp",
#       "https://http2.mlstatic.com/akiabara-blazer-saco-corderoy-negro-s-egratis-cuotas-sint-D_NQ_NP_913301-MLA20292560737_052015-F.webp",
#       "https://http2.mlstatic.com/akiabara-blazer-saco-corderoy-negro-s-egratis-cuotas-sint-D_NQ_NP_480301-MLA20292560690_052015-F.webp"].each do |photo_url|
#       p = Photo.new(url_photo: photo_url)
#       p.product = product
#       p.save!
#     end
# $red: #FD1015;
# $blue: #596681;
# $yellow: #FFC65A;
# $orange: #E67E22;
# $green: #1EDD88;
# $gray: #7E7E7E;
# $light-gray: #F4F4F4;
# $black: #000000;

# Product.all.each do |prod|
#   photo_collections.sample.each do |photo_url|
#     p = Photo.new(url_photo: photo_url)
#     p.product = prod
#     p.save!
#     puts "Photo created"
#   end
# end


# #SEEEDDDD

# nombres_marcas.each_with_index do |name, index|
#   brand = Brand.create!(
#     name: name,
#     logo: logos[index],
#     status: true,
#     )


#   3.times do
#     showroom = Showroom.new(
#       brand: brand,
#       name: Faker::Name.first_name,
#       phone_number: Faker::PhoneNumber.phone_number,
#       email: Faker::Internet.email
#     )
#     showroom.build_address(street: ADDRESSES.sample)
#     showroom.save!
#     10.times do
#       product = Product.create!(
#         name: Faker::Name.first_name,
#         min_price: Faker::Number.between(from: 100, to: 4999),
#         max_price: Faker::Number.between(from: 5000, to: 9999),
#         category: ["shoes", "dress", "shirts", "jeans", "shorts", "accessories"].sample,
#         description: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false) ,
#         sku_ext: Faker::Number.number(digits: 15),
#         published: false
#         )
# # $red: #FD1015;
# # $blue: #596681;
# # $yellow: #FFC65A;
# # $orange: #E67E22;
# # $green: #1EDD88;
# # $gray: #7E7E7E;
# # $light-gray: #F4F4F4;
#       3.times do
#         ["#FD1015", "#596681", "#FFC65A", "#E67E22", "#1EDD88"].each do |color|
#           variant = product.variants.build(
#             color: color,
#             size: ["34", "36", "38", "40"].sample
#           )
#           variant.showroom_variant_stocks.build(showroom: showroom, stock: rand(0..5))
#           variant.save!
#         end
#       end
#     end
#   end
# end

# puts "Adding photos to products"
# photo_collections = [["https://static.zara.net/photos///2019/I/0/1/p/5899/169/407/2/w/1920/5899169407_1_1_1.jpg?ts=1573241376830",
#         "https://static.zara.net/photos///2019/I/0/1/p/5899/169/407/2/w/1920/5899169407_2_1_1.jpg?ts=1573241405443",
#         "https://static.zara.net/photos///2019/I/0/1/p/5899/169/407/2/w/1920/5899169407_2_2_1.jpg?ts=1573241405445",
#         "https://static.zara.net/photos///2019/I/0/1/p/5899/169/407/2/w/1920/5899169407_2_4_1.jpg?ts=1573241398721",
#         "https://static.zara.net/photos///2019/I/0/1/p/5899/169/407/2/w/1920/5899169407_6_1_1.jpg?ts=1568129396974"
#         ],
#         [
#           "https://static.zara.net/photos///2019/I/M/1/p/0000/005/273/2/cb-0-0-4176-3072-Center/w/1920/0000005273_1_1_1.jpg?ts=1573228370250",
#           "https://static.zara.net/photos///2019/I/0/1/p/1856/300/808/2/w/1920/1856300808_1_1_1.jpg?ts=1573207337103",
#           "https://static.zara.net/photos///2019/I/0/1/p/1856/300/808/2/w/1920/1856300808_2_1_1.jpg?ts=1573207373696"
#         ],
#         [
#           "https://static.zara.net/photos///2019/I/2/1/p/0110/146/999/2/w/1920/0110146999_1_1_1.jpg?ts=1571844884435",
#           "https://static.zara.net/photos///2019/I/2/1/p/0110/146/999/2/w/1920/0110146999_2_2_1.jpg?ts=1572544939565",
#           "https://static.zara.net/photos///2019/I/2/1/p/0110/146/999/2/w/1920/0110146999_2_1_1.jpg?ts=1572544944749"
#         ],
#         [
#           "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_2_1_1.jpg?ts=1573030070793",
#           "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_2_3_1.jpg?ts=1573030071626",
#           "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_2_4_1.jpg?ts=1573030078976",
#           "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_2_5_1.jpg?ts=1573030084560",
#           "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_2_6_1.jpg?ts=1573030092960",
#           "https://static.zara.net/photos///2019/I/0/1/p/7901/915/808/2/w/1920/7901915808_6_1_1.jpg?ts=1567589993052"
#         ],
#         [
#           "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_1_1_1.jpg?ts=1571758747574",
#           "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_6_1_1.jpg?ts=1571758761312",
#           "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_2_3_1.jpg?ts=1571758793458",
#           "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_2_4_1.jpg?ts=1571758767779",
#           "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_2_5_1.jpg?ts=1571758767161",
#           "https://static.zara.net/photos///2019/I/0/1/p/2731/277/500/3/w/1920/2731277500_2_6_1.jpg?ts=1571758773463"
#         ],
#         [
#           "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_2_1_1.jpg?ts=1572515125513",
#           "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_1_1_1.jpg?ts=1572515058878",
#           "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_2_2_1.jpg?ts=1572515158249",
#           "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_2_3_1.jpg?ts=1572515191338",
#           "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_2_4_1.jpg?ts=1572518392909",
#           "https://static.zara.net/photos///2019/I/1/1/p/5155/001/040/3/w/1920/5155001040_2_15_1.jpg?ts=1573057207747"
#         ],
#         [
#           "https://static.zara.net/photos///2019/I/0/1/p/2157/263/600/2/w/1920/2157263600_1_1_1.jpg?ts=1573232689677",
#           "https://static.zara.net/photos///2019/I/0/1/p/2157/263/600/2/w/1920/2157263600_2_2_1.jpg?ts=1573232728735",
#           "https://static.zara.net/photos///2019/I/0/1/p/2157/263/600/2/w/1920/2157263600_2_1_1.jpg?ts=1573233131671",
#           "https://static.zara.net/photos///2019/I/0/1/p/2157/263/600/2/w/1920/2157263600_2_4_1.jpg?ts=1573232715255",
#           "https://static.zara.net/photos///2019/I/0/1/p/2157/263/600/2/w/1920/2157263600_6_1_1.jpg?ts=1573062036320"
#         ]
#       ]
# Product.all.each do |prod|
#   photo_collections.sample.each do |photo_url|
#     p = Photo.new(url_photo: photo_url)
#     p.product = prod
#     p.save!
#     puts "Photo created"
#   end
# end

# 5.times do
#   Bidding.create(
#     amount: Faker::Number.between(from: 100, to: 10000),
#     category: ["shoes", "dress", "shirts", "jeans", "shorts", "accessories"].sample,
#     user: User.all.sample
#     )
# end

# Bidding.all.each do |bidding|
#   brands = Brand.all
#   sorting = (1..brands.size).to_a.shuffle!
#   brands.each do |brand|
#     bidding.brand_ranks.build(
#       order: sorting.pop,
#       brand: brand).save!
#   end
#   if rand(0..50) > 40
#     variant = Product.where(category: bidding.category).sample.variants.sample
#     purchase = Purchase.create!(
#       showroom_variant_stock: ShowroomVariantStock.where(variant: variant).sample,
#       bidding: bidding,
#       qr: "link",
#       payment_method: ["efectivo", "tarjeta"].sample,
#       status: "activo"
#       )
#     if rand(0..50) > 40
#       Payment.create!(
#         purchase: purchase,
#         status: "pago"
#         )
#     end
#   end
# end


# puts "finished db"
