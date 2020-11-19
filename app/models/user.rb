class User < ApplicationRecord
  has_secure_password
  has_one :customer
  has_one :merchant
  validates_presence_of :email, :role
  validates_uniqueness_of :email

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

end
