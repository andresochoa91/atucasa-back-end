class Customer < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  validates :username,
    length: 3..20,
    uniqueness: true

  validates :email,
    format: { with: /\A(.+)@(.+)\z/, message: "Email invalid" },
    uniqueness: { case_sensitive: false },
    length: 4..254
  
  validates :password,
    length: { minimum: 8 },
    confirmation: true,
    on: :create

  validates :password,
    length: { minimum: 8 },
    allow_nil: true,
    on: :update

  validates :password_confirmation,
    length: { minimum: 8 },
    confirmation: true,
    on: :create

  validates :phone_number,
    format: { with: /\A\d{10}\z/, message: "bad format" },  
    allow_nil: true

  def self.handle_login(email, password)
    customer = Customer.find_by(email: email.downcase)
    if customer&.authenticate(password)
      customer_info = Hash.new
      customer_info[:token] = CoreModules::JsonWebToken.encode({
        customer_id: customer.id,
        username: customer.username.capitalize
      }, 4.hours.from_now)
      customer_info[:customer_id] = customer.id
      customer_info[:username] = customer.username.capitalize
      return customer_info
    else
      return false
    end
  end

end

# /\A(.+)@(.+)\z/
# /\A(+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
