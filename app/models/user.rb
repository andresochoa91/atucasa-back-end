class User < ApplicationRecord
  has_secure_password
  has_one :customer
  has_one :merchant
  has_one :location
  validates_presence_of :email, :role
  validates_uniqueness_of :email, :message => "Email already taken"

  before_destroy :delete_user_customer_or_merchant_and_location
  after_create :create_merchant_or_customer_and_location

  validates :email,
    format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: "Invalid Email" },
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

  validates :role,
    inclusion: {in: %w(customer merchant)}

  def self.handle_login(email, password)
    user = User.find_by(email: email.downcase)
    if user&.authenticate(password)
      user_info = Hash.new
      user_info[:token] = CoreModules::JsonWebToken.encode({
        user_id: user.id,
        email: user.email,
        role: user.role
      }, 4.hours.from_now)
      user_info[:user_id] = user.id
      user_info[:email] = user.email
      user_info[:role] = user.role
      return user_info
    else
      return false
    end
  end

  private 
    def delete_user_customer_or_merchant_and_location
      location.destroy
      merchant.products.destroy_all if merchant
      customer.destroy if customer
      merchant.destroy if merchant
    end

    def create_merchant_or_customer_and_location
      self.location = Location.create()

      user_slug = slugify

      if role == "customer"
        @customer = Customer.new(
          username: user_slug,
          slug: user_slug
        )
        self.customer = @customer
      else
        @merchant = Merchant.new(
          merchant_name: user_slug,
          slug: user_slug
        )
        self.merchant = @merchant
      end
    end

    def slugify
      slug = (email.split("@")[0]).parameterize

      while Customer.find_by(slug: slug) || Merchant.find_by(slug: slug) || slug.length < 4
        slug += (rand(0..9)).to_s
      end
      
      return slug
    end
end
