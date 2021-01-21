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
          slug: user_slug,
          profile_picture: "https://firebasestorage.googleapis.com/v0/b/leaflet-react.appspot.com/o/user.png?alt=media&token=16764122-d2d8-4253-a7f3-c9b628c320bd"
        )
        self.customer = @customer
      else
        @merchant = Merchant.new(
          merchant_name: user_slug,
          slug: user_slug,
          profile_picture: "https://firebasestorage.googleapis.com/v0/b/leaflet-react.appspot.com/o/store_profile.png?alt=media&token=61728311-d9c5-4b90-92d8-e9ae26d910d5",
          background_picture: "https://firebasestorage.googleapis.com/v0/b/leaflet-react.appspot.com/o/whitelandscape.jpg?alt=media&token=f1f5769a-c162-4231-98d7-3d619118ede7"
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
