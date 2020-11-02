# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

locations = Location.create([
  {
    country: "USA",
    state: "CA",
    city: "San Francisco"
  },
  {
    country: "USA",
    state: "CA",
    city: "San Jose"
  },
  {
    country: "USA",
    state: "NC",
    city: "Durham"
  },
  {
    country: "USA",
    state: "NC",
    city: "Raleigh"
  },
  {
    country: "Colombia",
    state: "Antioquia",
    city: "Medellin"
  },
  {
    country: "Colombia",
    state: "Bogota",
    city: "Bogota"
  },
])

users = User.create([
  {
    phone: 123456789,
    email: "a@b.com",
    role: "merchant",
    location_id: 1
  },
  {
    phone: 456789123,
    email: "b@b.com",
    role: "merchant",
    location_id: 2
  },
  {
    phone: 123654789,
    email: "c@b.com",
    role: "merchant",
    location_id: 3
  },
  {
    phone: 456789123,
    email: "d@b.com",
    role: "customer",
    location_id: 4
  },
  {
    phone: 78945613,
    email: "e@b.com",
    role: "customer",
    location_id: 5
  },
  {
    phone: 321654987,
    email: "f@b.com",
    role: "customer",
    location_id: 6
  },
  {
    phone: 654321987,
    email: "g@b.com",
    role: "admin",
    location_id: 1
  },
  {
    phone: 987456321,
    email: "h@b.com",
    role: "admin",
    location_id: 2
  },
  {
    phone: 789564321,
    email: "i@b.com",
    role: "admin",
    location_id: 3
  }
])

merchants = Merchant.create([
  {
    name: "Books inc",
    description: "Nice book store",
    address: "123 Hill St.",
    user_id: 1
  },
  {
    name: "Dunder Miflin inc",
    description: "Nice paper company",
    address: "789 Yay St.",
    user_id: 2
  },
  {
    name: "Ben & Jerries inc",
    description: "Nice icecream company",
    address: "555 Wow St.",
    user_id: 3
  }
])

customers = Customer.create([
  {
    first_name: "Bob",
    last_name: "Marley",
    user_id: 4
  },
  {
    first_name: "Jim",
    last_name: "Morrison",
    user_id: 5
  },
  {
    first_name: "Lana",
    last_name: "Del Rey",
    user_id: 6
  }
])

admins = Admin.create([
  {
    first_name: "John",
    last_name: "Yay",
    address: "456 Hi St.",
    user_id: 7
  },
  {
    first_name: "Marilyn",
    last_name: "Manson",
    address: "666 Hell St.",
    user_id: 8
  },{
    first_name: "Helen",
    last_name: "De Troy",
    address: "777 Valhalla St.",
    user_id: 9
  }
])