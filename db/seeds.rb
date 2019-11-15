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


BRANDS =
[
  {
    name: "Akiabara",
    logo: "https://i.imgur.com/cDxvUy7.png",
    status: true,
    showrooms: [
      {
        name: "Gurruchaga",
        phone_number: "123456847",
        email: "akiabara@jot.com",
        address: "San martin de tours 2908, Capital Federal, Buenos Aires"
      }
    ],
    products: [
      {
        name: "Saco Waters",
        min_price: 2000,
        max_price: 5000,
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
  },
  {
    name: "Clifftone",
    logo: "http://www.clifftone.com/wp-content/uploads/2018/09/logo_recto-clifftone_2018-01-e1536412572786.png",
    status: true,
    showrooms:
    [
      {
        name: "Tortuguitas",
        phone_number: "1545454632",
        email: "clifftone@jot.com",
        address: "San martin de tours 3500, Ciudad Autónoma de Buenos Aires, Argentina"
      }
    ],
    products:
    [
      {
        name: "Sandalia Brownstone Mujer - Thin Strips",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Base de corcho y látex de forma anatómica. Suela: EVA.Detalles: dos correas, cada una con una hebilla de espiga de metal con ajuste individual, Completa el diseño un grabado Clifftone en su lateral.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/ae9a9942_111-827e7c84b5c2553dcc15416869749028-640-0.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/ae9a9934_111-43fb973ed6207a490f15416869741779-1024-1024.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/sandalias-mujer121-3bcee41cd4374257e815430095756687-480-0.jpg"
        ],
        variants:
        [
          {
            color: "#010101",
            size: "37"
          },
          {
            color: "#010101",
            size: "38"
          },
          {
            color: "#010101",
            size: "39"
          },
          {
            color: "#521b0f",
            size: "36"
          },
          {
            color: "#521b0f",
            size: "37"
          },
          {
            color: "#521b0f",
            size: "38"
          }
        ]
      },
      {
        name: "Botas de Cuero Negro",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Bota de Mujer en Cuero Negro. Caña de 13cm y un Taco de 5cm. Completa su diseño un cierre elastico en ambos lados, para mayor comodidad a la hora de poner y sacarselas",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_6001_10801-5c5a412c370c35fcc115722814555603-1024-1024.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_6012_10801-514b433f159e2dff0915722814556929-640-0.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_6004_10801-801acb7275de72c1d515722814564316-640-0.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_6014_10801-17c40e3473b2ff693415722814577833-640-0.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_6002_10801-0cedbe809577cf65be15722814558303-640-0.jpg"
        ],
        variants: [
          {
            color: "#010101",
            size: "36"
          },
          {
            color: "#010101",
            size: "37"
          },
          {
            color: "#010101",
            size: "38"
          },
          {
            color: "#010101",
            size: "39"
          },
          {
            color: "#010101",
            size: "40"
          }
        ]
      },
      {
        name: "Bota Texana",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Bota Texana de Mujer, con capellada de cuero gastado. Caña de 12cm y Taco de 4cm de Alto. Completa el diseño un cierre en el lado interno para mayor comodidad.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_5985_10801-b6c0d9f1988491b3e915722817454763-640-0.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_5986_10801-e74beec61380b13a0a15722817467458-640-0.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_5990_10801-5a24e17f9a9565cd6b15722817467854-640-0.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_5995_10801-9d638fbdf462fb20a215722817469179-640-0.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_5991_10801-4f4b701143c1035fde15722817470469-640-0.jpg"
        ],
        variants: [
          {
            color: "#010101",
            size: "36"
          },
          {
            color: "#010101",
            size: "37"
          },
          {
            color: "#010101",
            size: "38"
          },
          {
            color: "#010101",
            size: "39"
          },
          {
            color: "#010101",
            size: "40"
          }
        ]
      },
      {
        name: "Sandalia Brownstone Mujer - Wide Strips",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Base de corcho y látex de forma anatómica. Suela: EVA. Detalles: dos correas, cada una con una hebilla de espiga de metal con ajuste individual, Completa el diseño un grabado Clifftone en su lateral.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/ae9a9937_111-6ad314321ed4e20fa615416872472415-640-0.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/ae9a9938_111-2b3c18a78d48747bfd15416872471447-640-0.jpg"
        ],
        variants: [
          {
            color: "#521b0f",
            size: "36"
          },
          {
            color: "#521b0f",
            size: "37"
          },
          {
            color: "#521b0f",
            size: "38"
          },
          {
            color: "#521b0f",
            size: "39"
          },
          {
            color: "#521b0f",
            size: "40"
          }
        ]
      },
      {
        name: "Tarjetero Cuero Vacuno",
        min_price: 1000,
        max_price: 2000,
        category: "accessories",
        description: "Tarjetero en Cuero Vacuno con Textura, 4 ranuras para tarjetas por lado y el logo grabado en el frente. 10cms de Ancho, 7,5 cms de Alto",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_5965_b1-517c19419a0fcd97a315711519469748-640-0.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_5957_b1-2295e9ff46d3111d7c15711519471527-640-0.jpg",
          "http://d26lpennugtm8s.cloudfront.net/stores/596/984/products/img_5955_b1-53475933580ae19adb15711519467803-640-0.jpg"
        ],
        variants: [
          {
            color: "#010101",
            size: "Unico"
          }
        ]
      }
    ]
  },
  {
    name: "Vitamina",
    logo: "https://i.imgur.com/EJ8pgGJ.png",
    status: true,
    showrooms: [
      {
        name: "Salguero",
        phone_number: "15648996",
        email: "vitamina@jot.com",
        address: "Jerónimo Salguero 3125, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina"
      }
    ],
    products:
    [
      {
        name: "Jean Brit Liston",
        min_price: 4000,
        max_price: 7000,
        category: "jeans",
        description: "Jean calce recto de tiro alto con tela azul súper desgastada , cuyo valor agregado son sus 2 lineas engomadas en frente de una de las piernas.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/wysiwyg/vitamina/jeans-ss20/desktop/Jeans-2B.jpg",
          "https://statics.glamit.com.ar/media/wysiwyg/vitamina/jeans-ss20/desktop/Jeans-2A.jpg"
        ],
        variants: [
          {
            color: "#0f1652",
            size: "34"
          },
          {
            color: "#0f1652",
            size: "36"
          },
          {
            color: "#0f1652",
            size: "38"
          },
          {
            color: "#0f1652",
            size: "40"
          }
        ]
      },

      {
        name: "JEAN HOLLYWOOD",
        min_price: 4000,
        max_price: 7000,
        category: "jeans",
        description: "Jean de calce Liverpool que combina denim y coating metalizado. Ampliando la propuesta de noche que permite estar canchera y relajada. Tiro medio.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/wysiwyg/vitamina/jeans-ss20/desktop/Jeans-9A.jpg",
          "https://statics.glamit.com.ar/media/wysiwyg/vitamina/jeans-ss20/desktop/Jeans-9B.jpg"
        ],
        variants: [
          {
            color: "#010101",
            size: "34"
          },
          {
            color: "#010101",
            size: "36"
          },
          {
            color: "#010101",
            size: "38"
          },
          {
            color: "#010101",
            size: "40"
          },
          {
            color: "#f8f9fc",
            size: "34"
          },
          {
            color: "#f8f9fc",
            size: "36"
          },
          {
            color: "#f8f9fc",
            size: "38"
          },
          {
            color: "#f8f9fc",
            size: "40"
          }
        ]
      },

      {
        name: "JEAN ABBEY BENAQUA",
        min_price: 4000,
        max_price: 7000,
        category: "jeans",
        description: "Jean skinny tiro alto con bajado de color a celeste, desgastado suave y delicado.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/wysiwyg/vitamina/jeans-ss20/desktop/Jeans-9B.jpg",
          "https://www.vitamina.com.ar/jeans/#hollywood"
        ],
        variants: [
          {
            color: "#0f1652",
            size: "34"
          },
          {
            color: "#0f1652",
            size: "36"
          },
          {
            color: "#0f1652",
            size: "38"
          },
          {
            color: "#0f1652",
            size: "40"
           }
        ]
      },
      {
        name: "JEAN LIVERPOOL SALEM",
        min_price: 4000,
        max_price: 7000,
        category: "jeans",
        description: "CALCE: Skinny tiro medio. TEJIDO: Gabardina 8 Oz",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32011h_01_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32011h_01_4.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32011h_01_2.jpg"
        ],
        variants: [
          {
            color: "#0f1652",
            size: "34"
          },
          {
            color: "#0f1652",
            size: "36"
          },
          {
            color: "#0f1652",
            size: "38"
          },
          {
            color: "#0f1652",
            size: "40"
          }
        ]
      },
      {
        name: "JEAN LIVERPOOL SALEM",
        min_price: 4000,
        max_price: 7000,
        category: "dress",
        description: "CALCE: Skinny tiro medio. TEJIDO: Gabardina 8 Oz",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32011s_01_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32011s_01_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32011s_01_3.jpg"
        ],
        variants: [
          {
            color: "#f8f9fc",
            size: "34"
          },
          {
            color: "#f8f9fc",
            size: "36"
          },
          {
            color: "#f8f9fc",
            size: "38"
          },
          {
            color: "#f8f9fc",
            size: "40"
          }
        ]
      },
      {
        name: "VESTIDO CAICOS",
        min_price: 3000,
        max_price: 7000,
        category: "dress",
        description: "Maxi-vestido con parte superior al cuerpo, y parte inferior en evasé. TEJIDO :Tejido plano con caído estampado con diseño abstracto.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm30080s_7p_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm30080s_7p_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm30080s_7p_3.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm30080s_7p_4.jpg"
        ],
        variants: [
          {
            color: "#f8f9fc",
            size: "34"
          },
          {
            color: "#f8f9fc",
            size: "36"
          },
          {
            color: "#f8f9fc",
            size: "38"
          },
          {
            color: "#f8f9fc",
            size: "40"
          }
        ]
      },
      {
        name: "VESTIDO NOSARA",
        min_price: 3000,
        max_price: 7000,
        category: "dress",
        description: "Vestido corto a la rodilla con frente cruzado tipo cache-coeur, breteles finos, volado en cruce de pollera. TEJIDO: Sarga liviana con caída, símil Tencel.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm300814_3o_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm300814_3o_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm300814_3o_3.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm300814_3o_4.jpg"
        ],
        variants: [
          {
            color: "#FF5733",
            size: "34"
          },
          {
            color: "#FF5733",
            size: "36"
          },
          {
            color: "#FF5733",
            size: "38"
          },
          {
            color: "#FF5733",
            size: "40"
          }
        ]
      },
      {
        name: "VESTIDO HOLLYWOOD",
        min_price: 3000,
        max_price: 7000,
        category: "dress",
        description: "Vestido corto con entalle en cintura con faja de símil cuero, escote en V cruzado, con falda fruncida y vuelo. TEJIDO : Punto liviano con efecto plisado, metalizado con foil.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32080l_10_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32080l_10_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32080l_10_3.jpg"
        ],
        variants: [
          {
            color: "#010101",
            size: "34"
          },
          {
            color: "#010101",
            size: "36"
          },
          {
            color: "#010101",
            size: "38"
          },
          {
            color: "#010101",
            size: "40"
          }
        ]
      },
      {
        name: "VESTIDO BEVERLY",
        min_price: 3000,
        max_price: 7000,
        category: "dress",
        description: "Vestido corto de calce relajado e impronta de remerón, con mangas al codo en ángulo, cuello a la base. TEJIDO : Tul bordado con lentejuelas en diseño de rayas acebradas.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32080i_10_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32080i_10_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32080i_10_3.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32080i_10_4.jpg"
        ],
        variants: [
          {
            color: "#010101",
            size: "34"
          },
          {
            color: "#010101",
            size: "36"
          },
          {
            color: "#010101",
            size: "38"
          },
          {
            color: "#010101",
            size: "40"
          }
        ]
      },
      {
        name: "VESTIDO CHICAGO",
        min_price: 3000,
        max_price: 7000,
        category: "dress",
        description: "Vestido camisero liso, corto, con mangas cortas enterizas, cuello estilo Mao, y detalle de nudo de ajuste en cintura. TEJIDO : Crepe liviano liso.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm320805_7z_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm320805_7z_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm320805_7z_3.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm320805_7z_4.jpg"
        ],
        variants: [
          {
            color: "#1d30d0",
            size: "34"
          },
          {
            color: "#1d30d0",
            size: "36"
          },
          {
            color: "#1d30d0",
            size: "38"
          },
          {
            color: "#1d30d0",
            size: "40"
          }
        ]
      },
      {
        name: "CAMISA VERDI",
        min_price: 2000,
        max_price: 5000,
        category: "shirts",
        description: "Camisa básica de corte clásico y calce semientallado, con detalle de tablas en espalda, borde inferior en curva y trabas en mangas para sostener el arremangado. TEJIDO: Poplín camisero liso o rayado.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/p/1/p10vm31031h_30_01.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/p/1/p10vm31031h_30_02.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/p/1/p10vm31031h_30_03.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/p/1/p10vm31031h_30_04.jpg"
        ],
        variants: [
          {
            color: "#f5f5fb",
            size: "34"
          },
          {
            color: "#f5f5fb",
            size: "36"
          },
          {
            color: "#f5f5fb",
            size: "38"
          },
          {
            color: "#f5f5fb",
            size: "40"
          },
          {
            color: "#7680d5",
            size: "36"
          },
          {
            color: "#7680d5",
            size: "38"
          },
          {
            color: "#7680d5",
            size: "40"
          },
          {
            color: "#FF5733",
            size: "38"
          },
          {
            color: "#FF5733",
            size: "40"
          }
        ]
      },
      {
        name: "CAMISOLA AUSTIN",
        min_price: 2000,
        max_price: 5000,
        category: "shirts",
        description: "Camisa larga, de calce amplio en evasé, mangas largas con detalle de cintas para atar y detalles camiseros. TEJIDO : Crepe liviano estampado con diseño de flores pintadas.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32030a_7p_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32030a_7p_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32030a_7p_3.jpg"
        ],
        variants: [
          {
            color: "#FF5733",
            size: "34"
          },
          {
            color: "#FF5733",
            size: "36"
          },
          {
            color: "#FF5733",
            size: "38"
          },
          {
            color: "#FF5733",
            size: "40"
          },
          {
            color: "#030303",
            size: "36"
          },
          {
            color: "# #030303",
            size: "38"
          },
          {
            color: "# #030303",
            size: "40"
                   }
        ]
      },
      {
        name: "CAMISOLA CALDES",
        min_price: 2000,
        max_price: 5000,
        category: "shirts",
        description: "Camisola larga y amplia con mangas 3/4, combinación de rayas y bolsillo plaqué. TEJIDO: Lino rayado camisero importado de Italia",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm30030c_41_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm30030c_41_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm30030c_41_3.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm30030c_41_4.jpg"
        ],
        variants: [
          {
            color: "#f76744",
            size: "34"
          },
          {
            color: "#f76744",
            size: "36"
          },
          {
            color: "#f76744",
            size: "38"
                   }
        ]
      },
      {
        name: "CAMISOLA PENSILVANIA",
        min_price: 2000,
        max_price: 5000,
        category: "shirts",
        description: "Puro lino, bordado, cortado en un modelo de camisola larga, con cuello mao y tajos en costados. TEJIDO: Fil a fil de textura linosa tejido a rayas.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32030l_5b_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32030l_5b_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32030l_5b_3.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p10vm32030l_5b_4.jpg"
        ],
        variants: [
          {
            color: "# #FFC300",
            size: "34"
          },
          {
            color: "# #FFC300",
            size: "36"
          },
          {
            color: "# #FFC300",
            size: "38"
          },
          {
            color: "# #010101",
            size: "34"
          },
          {
            color: "# #010101",
            size: "36"
          },
          {
            color: "# #010101",
            size: "38"
                    }
        ]
      },
      {
        name: "SLIP ON ATLANTA",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Slip on con plataforma a rayas. Doble tira cruzada en simil cuero tipo espejo, con logo Vitamina grabado en bajo relieve. MATERIAL: Simil cuero con acabado de espejo.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/p/1/p12vm320a08_33_01.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/p/1/p12vm320a08_33_02.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/p/1/p12vm320a08_33_03.jpg"
        ],
        variants: [
          {
            color: "#c6bfbd",
            size: "36"
          },
          {
            color: "#c6bfbd",
            size: "37"
          },
          {
            color: "#c6bfbd",
            size: "38"
          },
          {
            color: "#df7e66",
            size: "36"
          },
          {
            color: "#df7e66",
            size: "39"
          },
          {
            color: "#df7e66",
            size: "40"
          }
        ]
      },
      {
        name: "STILETTO MADISON",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Stiletto con escote cuadrado y detalle de tira en talón. MATERIAL: Gamuza de cabra.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/p/1/p12vm320a04_7p_01.jpg"
          ],
        variants: [
          {
            color: "#010101",
            size: "36"
          },
          {
            color: "#010101",
            size: "37"
          },
          {
            color: "#010101",
            size: "38"
          },
          {
            color: "#6699cf",
            size: "36"
          },
          {
            color: "#6699cf",
            size: "37"
          },
          {
            color: "#6699cf",
            size: "38"
          }
        ]
      },
      {
        name: "SLIP ON MENPHIS",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Slip on que combina dos cueros, uno de reptil y otro graneado. Taco redondo forrado y puntera metálica. MATERIAL: Cuero vacuno graneado combinado con reptil.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p12vm320a01_01_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/0/1/0190_copia.jpg"
          ],
        variants: [
          {
            color: "#010101",
            size: "36"
          },
          {
            color: "#010101",
            size: "37"
          },
          {
            color: "#010101",
            size: "38"
          },
          {
            color: "#fbfdfe",
            size: "36"
          },
          {
            color: "#fbfdfe",
            size: "37"
          },
          {
            color: "#fbfdfe",
            size: "38"
          }
        ]
      },
      {
        name: "Bota Mussi",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Bota tejida tipo media, en punta y con taco chupete, el ultimo grito de la moda. MATERIAL: Tejido tipo media, la variante negra combinada con lurex plateado y la variante roja lisa.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p12vm310a0b_30_01.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p12vm310a0b_30_02.jpg"
          ],
        variants: [
          {
            color: "#010101",
            size: "36"
          },
          {
            color: "#010101",
            size: "37"
          },
          {
            color: "#010101",
            size: "38"
          },
          {
            color: "#C70039",
            size: "36"
          },
          {
            color: "#C70039",
            size: "37"
          },
          {
            color: "#C70039",
            size: "38"
          }
        ]
      },
      {
        name: "AROS MADISON",
        min_price: 1000,
        max_price: 2000,
        category: "accessories",
        description: "Aros circulares en carey y detalle metálico. MATERIAL: circulos de carey con metal.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/p/1/p12vm320j07_55_01.jpg"
          ],
        variants: [
          {
            color: "#FFC300",
            size: "Unico"
          },
          {
            color: "# #5b5d5f",
            size: "Unico"
          }
        ]
      },
      {
        name: "SHOPPING HONOLULU",
        min_price: 1000,
        max_price: 2000,
        category: "accessories",
        description: "Shopping en plastico transparente, con sobre interior en tela estampada con logo. MATERIAL: Plástico transparente en colores combinado con cuero ecológico.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p12vm320b09_50_1.jpg"
          ],
        variants: [
          {
            color: "#f1f908",
            size: "Unico"
                    }
        ]
      },
      {

        name: "SHOPPING FARGO",
        min_price: 1000,
        max_price: 2000,
        category: "accessories",
        description: "Shopping en lona de 100% algodón, con base, acentos y logo Vitamina en charol. MATERIAL: Lona combinada con charol.",
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p12vm320b0d_23_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/104/thumbnail/1000x1500/9df78eab33525d08d6e5fb8d27136e95/v/i/vitamina_p12vm320b0d_23_2.jpg"
          ],
        variants: [
          {
            color: "#ea6112",
            size: "Unico"
          },
           {
            color: "#9e9e97",
            size: "Unico"
          },
        ]
      }
    ]
  },
  # {
  #   name: "Van Como Piña",
  #   logo: "http://paseochampagnat.com.ar/wp-content/uploads/2019/06/Van-Como-Pi%C3%B1a.jpg",
  #   status: true,
  #   showrooms: [
  #     {
  #       name: "Moldes",
  #       phone_number: "157899654",
  #       email: "vcp@jot.com",
  #       address: "Moldes 807, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina"
  #     }
  #   ],
  #   products: [
  #     {
  #       name: "Bikini Waikiki",
  #       min_price: 1000,
  #       max_price: 2000,
  #       category: "accessories",
  #       description: "Bikini Waikiki Colaless Tiritas (Conjunto)" ,
  #       sku_ext: Faker::Number.number(digits: 15),
  #       published: false,
  #       photos: [
  #         "https://cdn.shopify.com/s/files/1/0045/4970/5826/products/WaikikiTirit3_720x.jpg?v=1540249606",
  #         "https://cdn.shopify.com/s/files/1/0045/4970/5826/products/WaikikiTirit4_720x.jpg?v=1540249606",
  #         "https://cdn.shopify.com/s/files/1/0045/4970/5826/products/WaikikiTirit1_720x.jpg?v=1540249606",
  #       ],
  #       variants: [
  #         {
  #           color: "#596681",
  #           size: "36"
  #         },

  #         {
  #           color: "#596681",
  #           size: "38"
  #         },
  #         {
  #           color: "#596681",
  #           size: "40"
  #         }
  #       ]
  #     },
  #     {
  #       name: "Bikini Sleepy",
  #       min_price: 1000,
  #       max_price: 2000,
  #       category: "accessories",
  #       description: "Bikini Sleepy Hollow Colaless Con Voladitos (Conjunto)" ,
  #       sku_ext: Faker::Number.number(digits: 15),
  #       published: false,
  #       photos: [
  #         "https://cdn.shopify.com/s/files/1/0045/4970/5826/products/SleepyHollow3_720x.jpg?v=1540249512",
  #         "https://cdn.shopify.com/s/files/1/0045/4970/5826/products/SleepyHollow4_720x.jpg?v=1540249512",
  #         "https://cdn.shopify.com/s/files/1/0045/4970/5826/products/SleepyHollow1_720x.jpg?v=1540249512",
  #       ],
  #       variants: [
  #         {
  #           color: "#FF33A8",
  #           size: "36"
  #         },

  #         {
  #           color: "#FF33A8",
  #           size: "38"
  #         },
  #         {
  #           color: "#FF33A8",
  #           size: "40"
  #         }
  #       ]
  #     },
  #     {
  #       name: "Bikini Europa",
  #       min_price: 1000,
  #       max_price: 2000,
  #       category: "accessories",
  #       description: "Bikini Europa Bordeaux (Conjunto)" ,
  #       sku_ext: Faker::Number.number(digits: 15),
  #       published: false,
  #       photos: [
  #         "https://cdn.shopify.com/s/files/1/0045/4970/5826/products/Europa_Bordeaux_1_720x.jpg?v=1572033272",
  #         "https://cdn.shopify.com/s/files/1/0045/4970/5826/products/Europa_Bordeaux_2_720x.jpg?v=1572033272",
  #         "https://cdn.shopify.com/s/files/1/0045/4970/5826/products/Europa_Bordeaux_3_720x.jpg?v=1572033272",
  #       ],
  #       variants: [
  #         {
  #           color: "#C70039",
  #           size: "36"
  #         },

  #         {
  #           color: "#C70039",
  #           size: "38"
  #         },
  #         {
  #           color: "#C70039",
  #           size: "40"
  #         },
  #       ]
  #     }
  #   ]
  # },
  {
    name: "Sarkany",
    logo: "https://www.losgallegos.com.ar/wp-content/uploads/2016/09/sarkany-logo-320.png",
    status: true,
    showrooms: [
      {
        name: "Posadas",
        phone_number: "154545454",
        email: "sarkany@jot.com",
        address: "Avenida Corrientes 3247, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina"
      }
    ],
    products: [
      {
        name: "Sandalia Carolin",
        min_price: 8000,
        max_price: 12000,
        category: "Shoes",
        description: "Sandalia de mujer, en glitter ribeteado en cabretilla metalizada a tono con tira fina en talón. " ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://rickysarkany.vteximg.com.br/arquivos/ids/202874-562-562/IMG_0087rew.jpg?v=637074484345870000",
          "https://rickysarkany.vteximg.com.br/arquivos/ids/202875-562-562/IMG_0086rew.jpg?v=637074484476600000",
          "https://rickysarkany.vteximg.com.br/arquivos/ids/202876-562-562/IMG_0088rew.jpg?v=637074484587570000",
        ],
        variants: [
          {
            color: "#BFC9CA",
            size: "36"
          },

          {
            color: "#BFC9CA",
            size: "38"
          },
          {
            color: "#BFC9CA",
            size: "40"
          }
        ]
      },
        {
        name: "Sandalia Julia",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Sandalia de mujer en cuero de oveja color suela, con talón simulado para pisar." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://rickysarkany.vteximg.com.br/arquivos/ids/197296-562-562/1ZATCJULIA_MB.jpg?v=637021888147530000",
          "https://rickysarkany.vteximg.com.br/arquivos/ids/197297-562-562/1ZATCJULIA_MB_1.jpg?v=637021888348600000",
          "https://rickysarkany.vteximg.com.br/arquivos/ids/197297-562-562/1ZATCJULIA_MB_1.jpg?v=637021888348600000",
        ],
        variants: [
          {
            color: "#D35400",
            size: "36"
          },

          {
            color: "#D35400",
            size: "38"
          },
          {
            color: "#D35400",
            size: "40"
          }
        ]
      },
          {
        name: "Sandalia Flo",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Sandalia de mujer, con agarre en pulsera al tobillo en cabretilla" ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://rickysarkany.vteximg.com.br/arquivos/ids/196579-562-562/1ZATCFLO_NG.jpg?v=637014685434400000",
          "https://rickysarkany.vteximg.com.br/arquivos/ids/196580-562-562/1ZATCFLO_NG_1.jpg?v=637014685632830000",
          "https://rickysarkany.vteximg.com.br/arquivos/ids/196581-562-562/1ZATCFLO_NG_2.jpg?v=637014685791900000",
        ],
        variants: [
          {
            color: "#C70039",
            size: "36"
          },

          {
            color: "#C70039",
            size: "38"
          },
          {
            color: "#C70039",
            size: "40"
          },
        ]
      }
    ]
  },
  {
    name: "Rapsodia",
    logo: "https://i.imgur.com/IXje2Gc.png",
    status: true,
    showrooms: [
      {
        name: "Vicente Lopez",
        phone_number: "15684496616",
        email: "rapsodia@jot.com",
        address: "Aguirre 729, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina"
      }
    ],
    products: [
      {
        name: "Bota Delhi",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Bota de cuero negra con remaches metalicos, caña baja." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114118051a_01_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114118051a_01_2.jpg",
        ],
        variants: [
          {
            color: "#17202A",
            size: "36"
          },

          {
            color: "#17202A",
            size: "38"
          },
          {
            color: "#17202A",
            size: "40"
          }
        ]
      },
      {
        name: "Sandalia Tuscany",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Sandalia de cuero, estampado simil reptil negro con remaches pastilla metalicos." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114118074a_01_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114118074a_01_2.jpg"
        ],
        variants: [
          {
            color: "#17202A",
            size: "36"
          },

          {
            color: "#17202A",
            size: "38"
          },
          {
            color: "#17202A",
            size: "40"
          }
        ]
      },
            {
        name: "Vestido Ramya Suhan",
        min_price: 3000,
        max_price: 7000,
        category: "dress",
        description: "Vestido cordo verde estampado." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/4/3/43006_rapsodia_11114117210a_14_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/4/3/43007_rapsodia_11114117210a_14_1.jpg"
        ],
        variants: [
          {
            color: "#73C6B6",
            size: "36"
          },

          {
            color: "#73C6B6",
            size: "38"
          },
          {
            color: "#73C6B6",
            size: "40"
          }
        ]
      },
            {
        name: "Camisa Darra",
        min_price: 2000,
        max_price: 5000,
        category: "shirts",
        description: "Camisa de algodon amplia bordada." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/4/3/43083_rapsodia_11114016523i_02_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/4/3/43084_rapsodia_11114016523i_02_2.jpg"
        ],
        variants: [
          {
            color: "#F8F9F9",
            size: "36"
          },

          {
            color: "#F8F9F9",
            size: "38"
          },
          {
            color: "#F8F9F9",
            size: "40"
          }
        ]
      },
            {
        name: "Camisa Isaura Nisha",
        min_price: 2000,
        max_price: 5000,
        category: "shirts",
        description: "Camisa de punto y plano con bordado en dorado y plateado en el frente." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114117085c_38_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114117085c_38_2.jpg"
        ],
        variants: [
          {
            color: "#F8F9F9",
            size: "36"
          },

          {
            color: "#F8F9F9",
            size: "38"
          },
          {
            color: "#F8F9F9",
            size: "40"
          }
        ]
      },
            {
        name: "Legging Shinny Carter",
        min_price: 4000,
        max_price: 7000,
        category: "jeans",
        description: "Calza negra basica." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114117024a_01_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114117024a_01_2.jpg"
        ],
        variants: [
          {
            color: "#17202A",
            size: "36"
          },

          {
            color: "#17202A",
            size: "38"
          },
          {
            color: "#17202A",
            size: "40"
          }
        ]
      },
                  {
        name: "Pantalon New Tomy",
        min_price: 4000,
        max_price: 7000,
        category: "jeans",
        description: "Babucha basica al tobillo." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114117248c_01_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114117248c_01_2.jpg"
        ],
        variants: [
          {
            color: "#17202A",
            size: "36"
          },

          {
            color: "#17202A",
            size: "38"
          },
          {
            color: "#17202A",
            size: "40"
          }
        ]
      },
                  {
        name: "Legging Shinny Carter",
        min_price: 4000,
        max_price: 7000,
        category: "jeans",
        description: "Calza negra basica." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114117024a_01_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114117024a_01_2.jpg"
        ],
        variants: [
          {
            color: "#17202A",
            size: "36"
          },

          {
            color: "#17202A",
            size: "38"
          },
          {
            color: "#17202A",
            size: "40"
          }
        ]
      },
                  {
        name: "Pañuelo New Animal",
        min_price: 1000,
        max_price: 2000,
        category: "accessories",
        description: "Pañuelo suave con estampa animal print. Un clasico, reversionado" ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114117736i_27_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114117736i_27_3.jpg"
        ],
        variants: [
          {
            color: "#17202A",
            size: "36"
          },

          {
            color: "#17202A",
            size: "38"
          },
          {
            color: "#17202A",
            size: "40"
          }
        ]
      },
       {
        name: "Pulsera Azar",
        min_price: 1000,
        max_price: 2000,
        category: "accessories",
        description: "Pulsera con mix de cadenas, dijes y strass" ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114118310a_23_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/r/a/rapsodiaar_11114118310a_23_2.jpg"
        ],
        variants: [
          {
            color: "#D7DBDD",
            size: "36"
          },

          {
            color: "#D7DBDD",
            size: "38"
          },
          {
            color: "#D7DBDD",
            size: "40"
          }
        ]
      },
      {
        name: "Vestido Indie",
        min_price: 3000,
        max_price: 7000,
        category: "dress",
        description: "Vestido Indie" ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/4/6/46842_rapsodia_11114119549a_10_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/58/image/9df78eab33525d08d6e5fb8d27136e95/4/6/46843_rapsodia_11114119549a_10_2.jpg",
        ],
        variants: [
          {
            color: "#FDEDEC",
            size: "36"
          },

          {
            color: "##FDEDEC",
            size: "38"
          },
          {
            color: "##FDEDEC",
            size: "40"
          },
        ]
      }
    ]
  },
  {
    name: "Sweet",
    logo: "data:image/png;base64,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",
    status: true,
    showrooms: [
      {
        name: "Santa Fe",
        phone_number: "15684496616",
        email: "sweet@jot.com",
        address: "Avenida Santa Fe 3253, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina"
      }
    ],
    products: [
            {
        name: "VESTIDO CALEPIO",
        min_price: 3000,
        max_price: 7000,
        category: "dress",
        description: "Vestido largo de calce amplio floreado. Escote Halter. Espalda descubierta." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/87/image/650x957/9df78eab33525d08d6e5fb8d27136e95/s/w/sweet_010990_bl_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/87/image/650x957/9df78eab33525d08d6e5fb8d27136e95/s/w/sweet_010990_bl_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/87/thumbnail/708x1060/9df78eab33525d08d6e5fb8d27136e95/s/w/sweet_010990_bl_3.jpg"
        ],
        variants: [
          {
            color: "#F7F9F9",
            size: "36"
          },

          {
            color: "#F7F9F9",
            size: "38"
          },
          {
            color: "#F7F9F9",
            size: "40"
          }
        ]
      },
            {
        name: "CAMISA RAPUA",
        min_price: 2000,
        max_price: 5000,
        category: "shirts",
        description: "Camisa combinada con distintas telas. Escote en V. mangas largas." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/87/thumbnail/708x1060/9df78eab33525d08d6e5fb8d27136e95/s/w/sweet_052034_cr_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/87/thumbnail/708x1060/9df78eab33525d08d6e5fb8d27136e95/s/w/sweet_052034_cr_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/87/thumbnail/708x1060/9df78eab33525d08d6e5fb8d27136e95/s/w/sweet_052034_cr_3.jpg"
        ],
        variants: [
          {
            color: "#FDFEFE",
            size: "36"
          },

          {
            color: "#FDFEFE",
            size: "38"
          },
          {
            color: "#FDFEFE",
            size: "40"
          }
        ]
      },
      {
        name: "CARGO MULET",
        min_price: 4000,
        max_price: 7000,
        category: "jeans",
        description: "Jean cargo de tiro alto con botamanga skinny. Cierre delantero con cremallera. Bolsillos en los laterales a media pierna y cuatro bolsillos en cadera." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/87/image/650x957/9df78eab33525d08d6e5fb8d27136e95/s/w/sweet_061979_az_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/87/thumbnail/708x1060/9df78eab33525d08d6e5fb8d27136e95/s/w/sweet_061979_az_2.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/87/thumbnail/708x1060/9df78eab33525d08d6e5fb8d27136e95/s/w/sweet_061979_az_3.jpg"
        ],
        variants: [
          {
            color: "#D6EAF8",
            size: "36"
          },

          {
            color: "#D6EAF8",
            size: "38"
          },
          {
            color: "#D6EAF8",
            size: "40"
          }
        ]
      },
      {
        name: "PAÑUELO RUMPUT",
        min_price: 1000,
        max_price: 2000,
        category: "accessories",
        description: "Pañuelo de saten" ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://statics.glamit.com.ar/media/catalog/product/cache/87/thumbnail/708x1060/9df78eab33525d08d6e5fb8d27136e95/s/w/sweet_182786_rs_1.jpg",
          "https://statics.glamit.com.ar/media/catalog/product/cache/87/thumbnail/708x1060/9df78eab33525d08d6e5fb8d27136e95/s/w/sweet_182786_rs_2.jpg"
        ],
        variants: [
          {
            color: "#FDEDEC",
            size: "36"
          },

          {
            color: "#FDEDEC",
            size: "38"
          },
          {
            color: "#FDEDEC",
            size: "40"
          }
        ]
      }
    ]
  },
  {
    name: "Zara",
    logo: "https://i.imgur.com/TYPRRUv.png",
    status: true,
    showrooms: [
      {
        name: "Santa Fe",
        phone_number: "156879979",
        email: "zara@jot.com",
        address: "San martin de tours 2908, Capital Federal, Buenos Aires"
      }
    ],
    products: [
      {
        name: "Bota de tacón",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Bota de tacón de piel disponible en varios colores: negro y plomo. Corte de piel con estampado animal. Tacón fino forrado. Acabada en punta." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://static.zara.net/photos///2019/I/1/1/p/5036/001/005/2/w/1024/5036001005_2_2_1.jpg?ts=1571911876345",
          "https://static.zara.net/photos///2019/I/1/1/p/5036/001/005/2/w/1024/5036001005_1_1_1.jpg?ts=1571911908339",
        ],
        variants: [
          {
            color: "#FEF9E7",
            size: "36"
          },

          {
            color: "#FEF9E7",
            size: "38"
          },
          {
            color: "#FEF9E7",
            size: "40"
          }
        ]
      },
      {
        name: " Bota de tacón piel",
        min_price: 8000,
        max_price: 12000,
        category: "shoes",
        description: "Bota de tacón de piel disponible en varios colores: cuero y negro. Corte de serraje. Detalle de bordado en la caña. Tacón cowboy. Acabada en punta. Tiradores en los laterales." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://static.zara.net/photos///2019/I/1/1/p/5035/001/040/3/w/1024/5035001040_2_3_1.jpg?ts=1571904171446",
          "https://static.zara.net/photos///2019/I/1/1/p/5035/001/040/3/w/1024/5035001040_1_1_1.jpg?ts=1571904045705"
        ],
        variants: [
          {
            color: "#17202A",
            size: "36"
          },

          {
            color: "#17202A",
            size: "38"
          },
          {
            color: "#17202A",
            size: "40"
          }
        ]
      },
            {
        name: "Vestido Cinturón",
        min_price: 3000,
        max_price: 7000,
        category: "dress",
        description: "Vestido de escote pico y manga larga acabada en elástico. Detalle aplicación cinturón combinado a tono. Cierre frontal cruzado con botones." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://static.zara.net/photos///2019/I/0/1/p/0208/452/800/7/w/1920/0208452800_1_1_1.jpg?ts=<1573115282124></1573115282124>",
          "https://static.zara.net/photos///2019/I/0/1/p/0208/452/800/7/w/1920/0208452800_2_1_1.jpg?ts=1573115325455"
        ],
        variants: [
          {
            color: "#17202A",
            size: "36"
          },

          {
            color: "#17202A",
            size: "38"
          },
          {
            color: "#17202A",
            size: "40"
          }
        ]
      },
            {
        name: "Camisa Lazo",
        min_price: 2000,
        max_price: 5000,
        category: "shirts",
        description: "Camisa de cuello subido con escote pico y lazo. Manga larga acabada en puño. Bajo asimétrico con aberturas laterales. Cierre delantero con botones." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://static.zara.net/photos///2019/I/0/1/p/6929/301/406/26/w/1024/6929301406_1_1_1.jpg?ts=1573584654628",
          "https://static.zara.net/photos///2019/I/0/1/p/6929/301/406/26/w/1024/6929301406_2_1_1.jpg?ts=1573584668313"
        ],
        variants: [
          {
            color: "#17202A",
            size: "36"
          },

          {
            color: "#17202A",
            size: "38"
          },
          {
            color: "#17202A",
            size: "40"
          }
        ]
      },
            {
        name: "Camisa oversize",
        min_price: 2000,
        max_price: 5000,
        category: "shirts",
        description: "Camisa oversize de cuello subido y escote pico con lazo. Manga larga. " ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://static.zara.net/photos///2019/I/0/1/p/4043/172/020/26/w/1024/4043172020_1_1_1.jpg?ts=1573584657044",
          "https://static.zara.net/photos///2019/I/0/1/p/4043/172/020/26/w/1024/4043172020_2_1_1.jpg?ts=1573638481969"
        ],
        variants: [
          {
            color: "#FDFEFE",
            size: "36"
          },

          {
            color: "#FDFEFE",
            size: "38"
          },
          {
            color: "#FDFEFE",
            size: "40"
          }
        ]
      },
            {
        name: "Jeans ZW",
        min_price: 4000,
        max_price: 7000,
        category: "jeans",
        description: "Jeans de tiro alto con cinco bolsillos. Efecto lavado. Cierre frontal con cremallera y botón metálico." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://static.zara.net/photos///2019/I/0/1/p/2553/248/800/2/w/1024/2553248800_1_1_1.jpg?ts=1571310866783",
          "https://static.zara.net/photos///2019/I/0/1/p/2553/248/800/2/w/1024/2553248800_2_1_1.jpg?ts=1571310969898"
        ],
        variants: [
          {
            color: "#17202A",
            size: "36"
          },

          {
            color: "#17202A",
            size: "38"
          },
          {
            color: "#17202A",
            size: "40"
          }
        ]
      },
                  {
        name: "Jason Mom",
        min_price: 4000,
        max_price: 7000,
        category: "jeans",
        description: "Jeans de tiro alto con cinco bolsillos. Cierre delantero con cremallera y botón metálico." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://static.zara.net/photos///2019/I/0/1/p/8197/233/800/3/w/1024/8197233800_1_1_1.jpg?ts=1570445176736",
          "https://static.zara.net/photos///2019/I/0/1/p/8197/233/800/3/w/1920/8197233800_2_1_1.jpg?ts=1570445284494"
        ],
        variants: [
          {
            color: "#17202A",
            size: "36"
          },

          {
            color: "#17202A",
            size: "38"
          },
          {
            color: "#17202A",
            size: "40"
          }
        ]
      },
                  {
        name: "Vestido Lazada",
        min_price: 3000,
        max_price: 7000,
        category: "dress",
        description: "Vestido fluido de cuello redondo y manga larga .Detalle de lazada en mismo tejido. Cierre en espalda con abertura y botón." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://static.zara.net/photos///2019/I/0/1/p/8342/325/630/2/w/1024/8342325630_1_1_1.jpg?ts=1568655682492",
          "https://static.zara.net/photos///2019/I/0/1/p/8342/325/630/2/w/1024/8342325630_2_1_1.jpg?ts=1568655682711"
        ],
        variants: [
          {
            color: "#D98880",
            size: "36"
          },

          {
            color: "#D98880",
            size: "38"
          },
          {
            color: "#D98880",
            size: "40"
          }
        ]
      },
                  {
        name: "Anillo maxi ",
        min_price: 1000,
        max_price: 2000,
        category: "accessories",
        description: "Anillo maxi sello realizado en plata de ley y bañado en oro de 24 quilates." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://static.zara.net/photos///2019/I/0/1/p/2621/006/303/2/w/1024/2621006303_2_8_1.jpg?ts=1573494519209",
          "https://static.zara.net/photos///2019/I/0/1/p/2621/006/303/2/w/1024/2621006303_2_11_1.jpg?ts=1573637678999"
        ],
        variants: [
          {
            color: "#F4D03F",
            size: "36"
          },

          {
            color: "#F4D03F",
            size: "38"
          },
          {
            color: "#F4D03F",
            size: "40"
          }
        ]
      },
       {
        name: "Cadena con colgante",
        min_price: 1000,
        max_price: 2000,
        category: "accessories",
        description: "Cadena con colgante tipo medalla confeccionada en plata de ley y bañado en oro de 24 quilates. Cierre tipo palanca." ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://static.zara.net/photos///2019/I/0/1/p/2621/001/303/2/w/1024/2621001303_2_8_1.jpg?ts=1573726331627",
          "https://static.zara.net/photos///2019/I/0/1/p/2621/001/303/2/w/1024/2621001303_1_1_1.jpg?ts=1573726331625"
        ],
        variants: [
          {
            color: "F4D03F",
            size: "36"
          },

          {
            color: "F4D03F",
            size: "38"
          },
          {
            color: "F4D03F",
            size: "40"
          }
        ]
      },
      {
        name: "Vestido Esampado",
        min_price: 3000,
        max_price: 7000,
        category: "dress",
        description: "Vestido fluido de cuello redondo y manga larga amplia acabada. Detalle acabados con volante. Cierre en espalda con abertura y botón. " ,
        sku_ext: Faker::Number.number(digits: 15),
        published: false,
        photos: [
          "https://static.zara.net/photos///2019/I/0/1/p/8826/191/070/2/w/1024/8826191070_1_1_1.jpg?ts=1573650694045",
          "https://static.zara.net/photos///2019/I/0/1/p/8826/191/070/2/w/1024/8826191070_2_1_1.jpg?ts=1573665479641",
        ],
        variants: [
          {
            color: "#D5DBDB",
            size: "36"
          },

          {
            color: "#D5DBDB",
            size: "38"
          },
          {
            color: "#D5DBDB",
            size: "40"
          },
        ]
      }
    ]
  }
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
          stock: rand(1..5)
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



