# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  {
    email: "andres_ochoa91@hotmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "customer"
  },
  {
    email: "hlviets@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "customer"
  },
  {
    email: "andres_ochoa91@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  },
  {
    email: "helena@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    role: "merchant"
  }
])

products = Product.create([
  {
    product_name: "Vanilla Ice-cream", 
    category: "Ice-cream", 
    description: "Great!",
    price: 2, 
    tax: 2 * 0.09,
    available: true,
    merchant_id: 1
  },
  {
    product_name: "Raspberries", 
    category: "Fruits",
    description: "Amazing!",
    price: 3, 
    tax: 3 * 0.09,
    available: false,
    merchant_id: 1
  },
  {
    product_name: "Chocolate bar", 
    category: "Sweets",
    description: "The best!",
    price: 4, 
    tax: 4 * 0.09,
    available: true,
    merchant_id: 2
  },
  {
    product_name: "Lettuce", 
    category: "Vegetables",
    description: "Yummy!",
    price: 5, 
    tax: 5 * 0.09,
    available: false,
    merchant_id: 2
  }
])

links = Link.create([
  {
    site_name: "Facebook",
    url: "https://www.facebook.com",
    merchant_id: 1
  },
  {
    site_name: "Twitter",
    url: "https://www.twitter.com",
    merchant_id: 1
  },
  {
    site_name: "Facebook",
    url: "https://www.facebook.com",
    merchant_id: 2
  },
  {
    site_name: "Twitter",
    url: "https://www.twitter.com",
    merchant_id: 2
  }
])

orders = Order.create([
  {
    customer_id: 1,
    merchant_id: 1,
    accepted: false,
    current_user: "merchant",
    tip: 10,
    delivery_fee: 5
  },
  {
    customer_id: 2,
    merchant_id: 1,
    accepted: false,
    current_user: "merchant",
    tip: 14,
    delivery_fee: 5
  },
  {
    customer_id: 1,
    merchant_id: 2,
    accepted: false,
    current_user: "merchant",
    tip: 12,
    delivery_fee: 5
  },
  {
    customer_id: 2,
    merchant_id: 2,
    accepted: false,
    current_user: "merchant",
    tip: 17,
    delivery_fee: 5
  }
])

product_orders = ProductOrder.create([
  {
    product_id: 1,
    order_id: 1,
    product_name: Product.find(1).product_name,
    price: Product.find(1).price,
    tax: Product.find(1).tax,
    amount: 1,
  },
  {
    product_id: 2,
    order_id: 1,
    product_name: Product.find(2).product_name,
    price: Product.find(2).price,
    tax: Product.find(2).tax,
    amount: 2,
  },
  {
    product_id: 3,
    order_id: 3,
    product_name: Product.find(3).product_name,
    price: Product.find(3).price,
    tax: Product.find(3).tax,
    amount: 1,
  },
  {
    product_id: 4,
    order_id: 3,
    product_name: Product.find(4).product_name,
    price: Product.find(4).price,
    tax: Product.find(4).tax,
    amount: 1,
  }
])

