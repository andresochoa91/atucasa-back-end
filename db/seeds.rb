# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  # {
  #   email: "andres_ochoa91@hotmail.com",
  #   password: "123456789",
  #   password_confirmation: "123456789",
  #   role: "customer"
  # },
  # {
  #   email: "hlviets@gmail.com",
  #   password: "123456789",
  #   password_confirmation: "123456789",
  #   role: "customer"
  # },
  {
    email: "a@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  },
  {
    email: "b@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  },
  {
    email: "c@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  },
  {
    email: "d@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  },
  {
    email: "e@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  },
  {
    email: "f@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  },
  {
    email: "g@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  },
  {
    email: "h@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  },
  {
    email: "i@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  },
  {
    email: "j@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  },
  {
    email: "ab@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "customer"
  }
])

products = Product.create([
  {
    product_name: "Ben & Jerry's Vanilla Ice Cream", 
    description: "Vermont's Finest",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 1,
    product_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.elwtoYx_p6OkMV-YaBoVywHaEn%26pid%3DApi&f=1"
  },
  {
    product_name: "Pack of Raspberries", 
    description: "30 Raspberries in",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 1,
    product_picture: "https://cdn.shopify.com/s/files/1/2154/4937/products/Raspberry600x600_2_77ec1ec1-b919-4185-a86c-4b01ec964dc0_600x.jpg?v=1610541468"
  },
  {
    product_name: "Bunch of Bananas", 
    description: "A dozen of Ecuadorian Bananas",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 1,
    product_picture: "https://www.cartpk.com/media/catalog/product/cache/fc389275de9b28a1aa3797e29c004adb/b/a/banana_kela_large_dozen_1.jpg" 
  },
  {
    product_name: "Juan Valdez Coffee bag", 
    description: "Colombian Coffee",
    price: 6, 
    tax: 6 * 0.09,
    available: true,
    merchant_id: 1,
    product_picture: "https://www.cashgolosinas.com/4650-large_default/organic-coffee-in-juan-valdez-grain.jpg" 
  },
  {
    product_name: "Imposible Burger", 
    description: "Plant Based Veggetarian Meat",
    price: 8, 
    tax: 8 * 0.09,
    available: true,
    merchant_id: 1,
    product_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQInkCJlkcBNKhLnQdTqdE0re_l8CWzHXbiGKF4XAxhARDIMrnJVNIvrJIvRmM&usqp=CAc" 
  },
  {
    product_name: "Mexican Coca Cola", 
    description: "Coca Cola from Mexico",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 1,
    product_picture: "https://www.meijer.com/content/dam/meijer/product/0004/90/0000/46/0004900000463_1_A1C1_1200.png" 
  },
  {
    product_name: "Brad's Organic Olive Oil", 
    description: "Olive Oil from Spain",
    price: 7, 
    tax: 7 * 0.09,
    available: true,
    merchant_id: 1,
    product_picture: "https://d2d8wwwkmhfcva.cloudfront.net/800x/d2lnr5mha7bycj.cloudfront.net/product-image/file/large_1ac49425-e2de-416c-8620-9be9605107df.jpeg" 
  },
  {
    product_name: "Bag of Avocados", 
    description: "3 avocados, from Mexico",
    price: 4, 
    tax: 4 * 0.09,
    available: true,
    merchant_id: 1,
    product_picture: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/whole-and-sliced-avocado-on-wood-royalty-free-image-961101662-1545068511.jpg" 
  },
  
  
  {
    product_name: "Bunch of Bananas", 
    description: "A dozen of Ecuadorian Bananas",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 2,
    product_picture: "https://www.cartpk.com/media/catalog/product/cache/fc389275de9b28a1aa3797e29c004adb/b/a/banana_kela_large_dozen_1.jpg" 
  },
  {
    product_name: "Juan Valdez Coffee bag", 
    description: "Colombian Coffee",
    price: 6, 
    tax: 6 * 0.09,
    available: true,
    merchant_id: 2,
    product_picture: "https://www.cashgolosinas.com/4650-large_default/organic-coffee-in-juan-valdez-grain.jpg" 
  },
  {
    product_name: "Imposible Burger", 
    description: "Plant Based Veggetarian Meat",
    price: 8, 
    tax: 8 * 0.09,
    available: true,
    merchant_id: 2,
    product_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQInkCJlkcBNKhLnQdTqdE0re_l8CWzHXbiGKF4XAxhARDIMrnJVNIvrJIvRmM&usqp=CAc" 
  },
  {
    product_name: "Mexican Coca Cola", 
    description: "Coca Cola from Mexico",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 2,
    product_picture: "https://www.meijer.com/content/dam/meijer/product/0004/90/0000/46/0004900000463_1_A1C1_1200.png" 
  },
  {
    product_name: "Brad's Organic Olive Oil", 
    description: "Olive Oil from Spain",
    price: 7, 
    tax: 7 * 0.09,
    available: true,
    merchant_id: 2,
    product_picture: "https://d2d8wwwkmhfcva.cloudfront.net/800x/d2lnr5mha7bycj.cloudfront.net/product-image/file/large_1ac49425-e2de-416c-8620-9be9605107df.jpeg" 
  },
  {
    product_name: "Bag of Avocados", 
    description: "3 avocados, from Mexico",
    price: 4, 
    tax: 4 * 0.09,
    available: true,
    merchant_id: 2,
    product_picture: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/whole-and-sliced-avocado-on-wood-royalty-free-image-961101662-1545068511.jpg" 
  },


  {
    product_name: "Ben & Jerry's Vanilla Ice Cream", 
    description: "Vermont's Finest",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 3,
    product_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.elwtoYx_p6OkMV-YaBoVywHaEn%26pid%3DApi&f=1"
  },
  {
    product_name: "Pack of Raspberries", 
    description: "30 Raspberries in",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 3,
    product_picture: "https://cdn.shopify.com/s/files/1/2154/4937/products/Raspberry600x600_2_77ec1ec1-b919-4185-a86c-4b01ec964dc0_600x.jpg?v=1610541468"
  },
  {
    product_name: "Imposible Burger", 
    description: "Plant Based Veggetarian Meat",
    price: 8, 
    tax: 8 * 0.09,
    available: true,
    merchant_id: 3,
    product_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQInkCJlkcBNKhLnQdTqdE0re_l8CWzHXbiGKF4XAxhARDIMrnJVNIvrJIvRmM&usqp=CAc" 
  },
  {
    product_name: "Mexican Coca Cola", 
    description: "Coca Cola from Mexico",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 3,
    product_picture: "https://www.meijer.com/content/dam/meijer/product/0004/90/0000/46/0004900000463_1_A1C1_1200.png" 
  },
  {
    product_name: "Brad's Organic Olive Oil", 
    description: "Olive Oil from Spain",
    price: 7, 
    tax: 7 * 0.09,
    available: true,
    merchant_id: 3,
    product_picture: "https://d2d8wwwkmhfcva.cloudfront.net/800x/d2lnr5mha7bycj.cloudfront.net/product-image/file/large_1ac49425-e2de-416c-8620-9be9605107df.jpeg" 
  },
  {
    product_name: "Bag of Avocados", 
    description: "3 avocados, from Mexico",
    price: 4, 
    tax: 4 * 0.09,
    available: true,
    merchant_id: 3,
    product_picture: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/whole-and-sliced-avocado-on-wood-royalty-free-image-961101662-1545068511.jpg" 
  },


  {
    product_name: "Ben & Jerry's Vanilla Ice Cream", 
    description: "Vermont's Finest",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 4,
    product_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.elwtoYx_p6OkMV-YaBoVywHaEn%26pid%3DApi&f=1"
  },
  {
    product_name: "Pack of Raspberries", 
    description: "30 Raspberries in",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 4,
    product_picture: "https://cdn.shopify.com/s/files/1/2154/4937/products/Raspberry600x600_2_77ec1ec1-b919-4185-a86c-4b01ec964dc0_600x.jpg?v=1610541468"
  },
  {
    product_name: "Bunch of Bananas", 
    description: "A dozen of Ecuadorian Bananas",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 4,
    product_picture: "https://www.cartpk.com/media/catalog/product/cache/fc389275de9b28a1aa3797e29c004adb/b/a/banana_kela_large_dozen_1.jpg" 
  },
  {
    product_name: "Juan Valdez Coffee bag", 
    description: "Colombian Coffee",
    price: 6, 
    tax: 6 * 0.09,
    available: true,
    merchant_id: 4,
    product_picture: "https://www.cashgolosinas.com/4650-large_default/organic-coffee-in-juan-valdez-grain.jpg" 
  },
  {
    product_name: "Brad's Organic Olive Oil", 
    description: "Olive Oil from Spain",
    price: 7, 
    tax: 7 * 0.09,
    available: true,
    merchant_id: 4,
    product_picture: "https://d2d8wwwkmhfcva.cloudfront.net/800x/d2lnr5mha7bycj.cloudfront.net/product-image/file/large_1ac49425-e2de-416c-8620-9be9605107df.jpeg" 
  },
  {
    product_name: "Bag of Avocados", 
    description: "3 avocados, from Mexico",
    price: 4, 
    tax: 4 * 0.09,
    available: true,
    merchant_id: 4,
    product_picture: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/whole-and-sliced-avocado-on-wood-royalty-free-image-961101662-1545068511.jpg" 
  },


  {
    product_name: "Ben & Jerry's Vanilla Ice Cream", 
    description: "Vermont's Finest",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 5,
    product_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.elwtoYx_p6OkMV-YaBoVywHaEn%26pid%3DApi&f=1"
  },
  {
    product_name: "Pack of Raspberries", 
    description: "30 Raspberries in",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 5,
    product_picture: "https://cdn.shopify.com/s/files/1/2154/4937/products/Raspberry600x600_2_77ec1ec1-b919-4185-a86c-4b01ec964dc0_600x.jpg?v=1610541468"
  },
  {
    product_name: "Bunch of Bananas", 
    description: "A dozen of Ecuadorian Bananas",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 5,
    product_picture: "https://www.cartpk.com/media/catalog/product/cache/fc389275de9b28a1aa3797e29c004adb/b/a/banana_kela_large_dozen_1.jpg" 
  },
  {
    product_name: "Juan Valdez Coffee bag", 
    description: "Colombian Coffee",
    price: 6, 
    tax: 6 * 0.09,
    available: true,
    merchant_id: 5,
    product_picture: "https://www.cashgolosinas.com/4650-large_default/organic-coffee-in-juan-valdez-grain.jpg" 
  },
  {
    product_name: "Imposible Burger", 
    description: "Plant Based Veggetarian Meat",
    price: 8, 
    tax: 8 * 0.09,
    available: true,
    merchant_id: 5,
    product_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQInkCJlkcBNKhLnQdTqdE0re_l8CWzHXbiGKF4XAxhARDIMrnJVNIvrJIvRmM&usqp=CAc" 
  },
  {
    product_name: "Mexican Coca Cola", 
    description: "Coca Cola from Mexico",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 5,
    product_picture: "https://www.meijer.com/content/dam/meijer/product/0004/90/0000/46/0004900000463_1_A1C1_1200.png" 
  },


  {
    product_name: "Ben & Jerry's Vanilla Ice Cream", 
    description: "Vermont's Finest",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 6,
    product_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.elwtoYx_p6OkMV-YaBoVywHaEn%26pid%3DApi&f=1"
  },
  {
    product_name: "Juan Valdez Coffee bag", 
    description: "Colombian Coffee",
    price: 6, 
    tax: 6 * 0.09,
    available: true,
    merchant_id: 6,
    product_picture: "https://www.cashgolosinas.com/4650-large_default/organic-coffee-in-juan-valdez-grain.jpg" 
  },
  {
    product_name: "Imposible Burger", 
    description: "Plant Based Veggetarian Meat",
    price: 8, 
    tax: 8 * 0.09,
    available: true,
    merchant_id: 6,
    product_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQInkCJlkcBNKhLnQdTqdE0re_l8CWzHXbiGKF4XAxhARDIMrnJVNIvrJIvRmM&usqp=CAc" 
  },
  {
    product_name: "Mexican Coca Cola", 
    description: "Coca Cola from Mexico",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 6,
    product_picture: "https://www.meijer.com/content/dam/meijer/product/0004/90/0000/46/0004900000463_1_A1C1_1200.png" 
  },
  {
    product_name: "Brad's Organic Olive Oil", 
    description: "Olive Oil from Spain",
    price: 7, 
    tax: 7 * 0.09,
    available: true,
    merchant_id: 6,
    product_picture: "https://d2d8wwwkmhfcva.cloudfront.net/800x/d2lnr5mha7bycj.cloudfront.net/product-image/file/large_1ac49425-e2de-416c-8620-9be9605107df.jpeg" 
  },
  {
    product_name: "Bag of Avocados", 
    description: "3 avocados, from Mexico",
    price: 4, 
    tax: 4 * 0.09,
    available: true,
    merchant_id: 6,
    product_picture: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/whole-and-sliced-avocado-on-wood-royalty-free-image-961101662-1545068511.jpg" 
  },


  {
    product_name: "Ben & Jerry's Vanilla Ice Cream", 
    description: "Vermont's Finest",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 7,
    product_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.elwtoYx_p6OkMV-YaBoVywHaEn%26pid%3DApi&f=1"
  },
  {
    product_name: "Pack of Raspberries", 
    description: "30 Raspberries in",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 7,
    product_picture: "https://cdn.shopify.com/s/files/1/2154/4937/products/Raspberry600x600_2_77ec1ec1-b919-4185-a86c-4b01ec964dc0_600x.jpg?v=1610541468"
  },
  {
    product_name: "Bunch of Bananas", 
    description: "A dozen of Ecuadorian Bananas",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 7,
    product_picture: "https://www.cartpk.com/media/catalog/product/cache/fc389275de9b28a1aa3797e29c004adb/b/a/banana_kela_large_dozen_1.jpg" 
  },
  {
    product_name: "Juan Valdez Coffee bag", 
    description: "Colombian Coffee",
    price: 6, 
    tax: 6 * 0.09,
    available: true,
    merchant_id: 7,
    product_picture: "https://www.cashgolosinas.com/4650-large_default/organic-coffee-in-juan-valdez-grain.jpg" 
  },
  {
    product_name: "Imposible Burger", 
    description: "Plant Based Veggetarian Meat",
    price: 8, 
    tax: 8 * 0.09,
    available: true,
    merchant_id: 7,
    product_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQInkCJlkcBNKhLnQdTqdE0re_l8CWzHXbiGKF4XAxhARDIMrnJVNIvrJIvRmM&usqp=CAc" 
  },
  {
    product_name: "Bag of Avocados", 
    description: "3 avocados, from Mexico",
    price: 4, 
    tax: 4 * 0.09,
    available: true,
    merchant_id: 7,
    product_picture: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/whole-and-sliced-avocado-on-wood-royalty-free-image-961101662-1545068511.jpg" 
  },


  {
    product_name: "Ben & Jerry's Vanilla Ice Cream", 
    description: "Vermont's Finest",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 8,
    product_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.elwtoYx_p6OkMV-YaBoVywHaEn%26pid%3DApi&f=1"
  },
  {
    product_name: "Pack of Raspberries", 
    description: "30 Raspberries in",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 8,
    product_picture: "https://cdn.shopify.com/s/files/1/2154/4937/products/Raspberry600x600_2_77ec1ec1-b919-4185-a86c-4b01ec964dc0_600x.jpg?v=1610541468"
  },
  {
    product_name: "Bunch of Bananas", 
    description: "A dozen of Ecuadorian Bananas",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 8,
    product_picture: "https://www.cartpk.com/media/catalog/product/cache/fc389275de9b28a1aa3797e29c004adb/b/a/banana_kela_large_dozen_1.jpg" 
  },
  {
    product_name: "Mexican Coca Cola", 
    description: "Coca Cola from Mexico",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 8,
    product_picture: "https://www.meijer.com/content/dam/meijer/product/0004/90/0000/46/0004900000463_1_A1C1_1200.png" 
  },
  {
    product_name: "Brad's Organic Olive Oil", 
    description: "Olive Oil from Spain",
    price: 7, 
    tax: 7 * 0.09,
    available: true,
    merchant_id: 8,
    product_picture: "https://d2d8wwwkmhfcva.cloudfront.net/800x/d2lnr5mha7bycj.cloudfront.net/product-image/file/large_1ac49425-e2de-416c-8620-9be9605107df.jpeg" 
  },
  {
    product_name: "Bag of Avocados", 
    description: "3 avocados, from Mexico",
    price: 4, 
    tax: 4 * 0.09,
    available: true,
    merchant_id: 8,
    product_picture: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/whole-and-sliced-avocado-on-wood-royalty-free-image-961101662-1545068511.jpg" 
  },


  {
    product_name: "Ben & Jerry's Vanilla Ice Cream", 
    description: "Vermont's Finest",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 9,
    product_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.elwtoYx_p6OkMV-YaBoVywHaEn%26pid%3DApi&f=1"
  },
  {
    product_name: "Pack of Raspberries", 
    description: "30 Raspberries in",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 9,
    product_picture: "https://cdn.shopify.com/s/files/1/2154/4937/products/Raspberry600x600_2_77ec1ec1-b919-4185-a86c-4b01ec964dc0_600x.jpg?v=1610541468"
  },
  {
    product_name: "Bunch of Bananas", 
    description: "A dozen of Ecuadorian Bananas",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 9,
    product_picture: "https://www.cartpk.com/media/catalog/product/cache/fc389275de9b28a1aa3797e29c004adb/b/a/banana_kela_large_dozen_1.jpg" 
  },
  {
    product_name: "Juan Valdez Coffee bag", 
    description: "Colombian Coffee",
    price: 6, 
    tax: 6 * 0.09,
    available: true,
    merchant_id: 9,
    product_picture: "https://www.cashgolosinas.com/4650-large_default/organic-coffee-in-juan-valdez-grain.jpg" 
  },
  {
    product_name: "Imposible Burger", 
    description: "Plant Based Veggetarian Meat",
    price: 8, 
    tax: 8 * 0.09,
    available: true,
    merchant_id: 9,
    product_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQInkCJlkcBNKhLnQdTqdE0re_l8CWzHXbiGKF4XAxhARDIMrnJVNIvrJIvRmM&usqp=CAc" 
  },
  {
    product_name: "Bag of Avocados", 
    description: "3 avocados, from Mexico",
    price: 4, 
    tax: 4 * 0.09,
    available: true,
    merchant_id: 9,
    product_picture: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/whole-and-sliced-avocado-on-wood-royalty-free-image-961101662-1545068511.jpg" 
  },


  {
    product_name: "Pack of Raspberries", 
    description: "30 Raspberries in",
    price: 5, 
    tax: 5 * 0.09,
    available: true,
    merchant_id: 10,
    product_picture: "https://cdn.shopify.com/s/files/1/2154/4937/products/Raspberry600x600_2_77ec1ec1-b919-4185-a86c-4b01ec964dc0_600x.jpg?v=1610541468"
  },
  {
    product_name: "Bunch of Bananas", 
    description: "A dozen of Ecuadorian Bananas",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 10,
    product_picture: "https://www.cartpk.com/media/catalog/product/cache/fc389275de9b28a1aa3797e29c004adb/b/a/banana_kela_large_dozen_1.jpg" 
  },
  {
    product_name: "Juan Valdez Coffee bag", 
    description: "Colombian Coffee",
    price: 6, 
    tax: 6 * 0.09,
    available: true,
    merchant_id: 10,
    product_picture: "https://www.cashgolosinas.com/4650-large_default/organic-coffee-in-juan-valdez-grain.jpg" 
  },
  {
    product_name: "Imposible Burger", 
    description: "Plant Based Veggetarian Meat",
    price: 8, 
    tax: 8 * 0.09,
    available: true,
    merchant_id: 10,
    product_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQInkCJlkcBNKhLnQdTqdE0re_l8CWzHXbiGKF4XAxhARDIMrnJVNIvrJIvRmM&usqp=CAc" 
  },
  {
    product_name: "Mexican Coca Cola", 
    description: "Coca Cola from Mexico",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 10,
    product_picture: "https://www.meijer.com/content/dam/meijer/product/0004/90/0000/46/0004900000463_1_A1C1_1200.png" 
  },
  {
    product_name: "Brad's Organic Olive Oil", 
    description: "Olive Oil from Spain",
    price: 7, 
    tax: 7 * 0.09,
    available: true,
    merchant_id: 10,
    product_picture: "https://d2d8wwwkmhfcva.cloudfront.net/800x/d2lnr5mha7bycj.cloudfront.net/product-image/file/large_1ac49425-e2de-416c-8620-9be9605107df.jpeg" 
  }
])


User.find(1).location.update(
  address: "455 40th Ave",
  city: "San Francisco",
  state: "CA",
  country: "US",
  zip_code: "94121",
  details: "First Floor"
)

User.find(2).location.update(
  address: "234 18th Ave",
  city: "San Francisco",
  state: "CA",
  country: "US",
  zip_code: "94121",
  details: "First Floor"
)

User.find(3).location.update(
  address: "2899 Bush St",
  city: "San Francisco",
  state: "CA",
  country: "US",
  zip_code: "94115",
  details: "First Floor"
)

User.find(4).location.update(
  address: "1492 Funston Ave",
  city: "San Francisco",
  state: "CA",
  country: "US",
  zip_code: "94109",
  details: "First Floor"
)

User.find(5).location.update(
  address: "1821 Hayes St",
  city: "San Francisco",
  state: "CA",
  country: "US",
  zip_code: "94117",
  details: "First Floor"
)

User.find(6).location.update(
  address: "106 Noe St",
  city: "San Francisco",
  state: "CA",
  country: "US",
  zip_code: "94114",
  details: "First Floor"
)

User.find(7).location.update(
  address: "68 States St",
  city: "San Francisco",
  state: "CA",
  country: "US",
  zip_code: "94114",
  details: "First Floor"
)

User.find(8).location.update(
  address: "1398 9th Ave",
  city: "San Francisco",
  state: "CA",
  country: "US",
  zip_code: "94122",
  details: "First Floor"
)

User.find(9).location.update(
  address: "1501 32nd Ave",
  city: "San Francisco",
  state: "CA",
  country: "US",
  zip_code: "94122",
  details: "First Floor"
)

User.find(10).location.update(
  address: "2120 Taraval St",
  city: "San Francisco",
  state: "CA",
  country: "US",
  zip_code: "94116",
  details: "First Floor"
)

User.find(11).location.update(
  address: "345 Rivera St.",
  city: "San Francisco",
  state: "CA",
  country: "US",
  zip_code: "94116",
  details: "First Floor"
)




Merchant.find(1).update(
  merchant_name: "Super Star Store",
  profile_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fd2v9y0dukr6mq2.cloudfront.net%2Fvideo%2Fthumbnail%2FqEue9C6%2Fsuperstar-word-3d-fireworks-stars-animated-video_v1e2qxrfp__F0011.png&f=1&nofb=1"
)

Merchant.find(2).update(
  merchant_name: "Productos Exquisitos",
  profile_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.templura.com%2Fwp-content%2Fuploads%2F2017%2F10%2FDelicias-con-champagne-en-caja-de-metal.jpg&f=1&nofb=1"
)

Merchant.find(3).update(
  merchant_name: "Legally Grown",
  profile_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.rd.com%2Fwp-content%2Fuploads%2Fsites%2F2%2F2016%2F06%2F06-things-know-organic-food-locally-grown.jpg&f=1&nofb=1"
)

Merchant.find(4).update(
  merchant_name: "Bay Area Delicacies",
  profile_picture: "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fbloximages.newyork1.vip.townnews.com%2Fstltoday.com%2Fcontent%2Ftncms%2Fassets%2Fv3%2Feditorial%2F8%2Fb1%2F8b101299-2710-5946-b4e4-ce6c2a43230d%2F4f930042da8b4.preview-620.jpg&f=1&nofb=1"
)

Merchant.find(5).update(
  merchant_name: "LaninX Corner",
  profile_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ffastly.4sqi.net%2Fimg%2Fgeneral%2F200x200%2FVGVC040P4S30LACCBQ0LI3XXEXLVB2R5QV5VEM5PI45H4TLV.jpg&f=1&nofb=1"
)

Merchant.find(6).update(
  merchant_name: "Sapore Italiano",
  profile_picture: "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.huffpost.com%2Fgen%2F935109%2Fthumbs%2Fo-ITALIAN-FOOD-RECIPES-PASTA-facebook.jpg&f=1&nofb=1"
)

Merchant.find(7).update(
  merchant_name: "De la Esquina",
  profile_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.0eDHuwbwfzL1oDlM1lfKcwHaF7%26pid%3DApi&f=1"
)

Merchant.find(8).update(
  merchant_name: "Friendship Store",
  profile_picture: "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fturnaroundtour.com%2Fwp-content%2Fuploads%2Fhappy-customer-300x288.jpg&f=1&nofb=1"
)

Merchant.find(9).update(
  merchant_name: "Veggies and more",
  profile_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.dOXV8-K8vH4KuXfgZswqZgHaE8%26pid%3DApi&f=1"
)

Merchant.find(10).update(
  merchant_name: "Fresh Air Store",
  profile_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia.npr.org%2Fassets%2Fimg%2F2018%2F08%2F03%2Fnpr_freshair_podcasttile_wide-981a00305a1818fdde128ab26d9071dafc9f36ac.jpg%3Fs%3D1400&f=1&nofb=1"
)




# products = Product.create([
#   # {
#   #   product_name: "Milo", 
#   #   description: "Chocolate Drink",
#   #   price: 7, 
#   #   tax: 7 * 0.09,
#   #   available: true,
#   #   merchant_id: 11,
#   #   product_picture: "https://kidspot.co.nz/wp-content/uploads/2018/08/MILO-KIDSPOT-Sampling-Group-1024x800-v3.jpg"
#   # },
#   {
#     product_name: "Ben & Jerry's Vanilla Ice Cream", 
#     description: "Vermont's Finest",
#     price: 5, 
#     tax: 5 * 0.09,
#     available: true,
#     merchant_id: 12,
#     product_picture: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.elwtoYx_p6OkMV-YaBoVywHaEn%26pid%3DApi&f=1"
#   },
#   {
#     product_name: "Pack of Raspberries", 
#     description: "30 Raspberries in",
#     price: 5, 
#     tax: 5 * 0.09,
#     available: true,
#     merchant_id: 12,
#     product_picture: "https://cdn.shopify.com/s/files/1/2154/4937/products/Raspberry600x600_2_77ec1ec1-b919-4185-a86c-4b01ec964dc0_600x.jpg?v=1610541468"
#   },
#   {
#     product_name: "Bunch of Bananas", 
#     description: "A dozen of Ecuadorian Bananas",
#     price: 2, 
#     tax: 2 * 0.09,
#     available: true,
#     merchant_id: 12,
#     product_picture: "https://www.cartpk.com/media/catalog/product/cache/fc389275de9b28a1aa3797e29c004adb/b/a/banana_kela_large_dozen_1.jpg" 
#   },
#   {
#     product_name: "Juan Valdez Coffee bag", 
#     description: "Colombian Coffee",
#     price: 6, 
#     tax: 6 * 0.09,
#     available: true,
#     merchant_id: 12,
#     product_picture: "https://www.cashgolosinas.com/4650-large_default/organic-coffee-in-juan-valdez-grain.jpg" 
#   },
#   {
#     product_name: "Imposible Burger", 
#     description: "Plant Based Veggetarian Meat",
#     price: 8, 
#     tax: 8 * 0.09,
#     available: true,
#     merchant_id: 12,
#     product_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQInkCJlkcBNKhLnQdTqdE0re_l8CWzHXbiGKF4XAxhARDIMrnJVNIvrJIvRmM&usqp=CAc" 
#   },
#   {
#     product_name: "Mexican Coca Cola", 
#     description: "Coca Cola from Mexico",
#     price: 2, 
#     tax: 2 * 0.09,
#     available: true,
#     merchant_id: 12,
#     product_picture: "https://www.meijer.com/content/dam/meijer/product/0004/90/0000/46/0004900000463_1_A1C1_1200.png" 
#   },
#   {
#     product_name: "Brad's Organic Olive Oil", 
#     description: "Olive Oil from Spain",
#     price: 7, 
#     tax: 7 * 0.09,
#     available: true,
#     merchant_id: 12,
#     product_picture: "https://d2d8wwwkmhfcva.cloudfront.net/800x/d2lnr5mha7bycj.cloudfront.net/product-image/file/large_1ac49425-e2de-416c-8620-9be9605107df.jpeg" 
#   },
#   {
#     product_name: "Bag of Avocados", 
#     description: "3 avocados, from Mexico",
#     price: 4, 
#     tax: 4 * 0.09,
#     available: true,
#     merchant_id: 12,
#     product_picture: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/whole-and-sliced-avocado-on-wood-royalty-free-image-961101662-1545068511.jpg" 
#   }
# ])