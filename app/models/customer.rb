class Customer < ApplicationRecord
  belongs_to :user
  has_many :orders
  # validates_presence_of :username
  # validates_uniqueness_of :username

  validates :username,
    length: 3..20,
    uniqueness: true,
    allow_nil: true,
    on: :update

  validates :first_name, :last_name,
    length: 2..20,
    allow_nil: true,
    on: :update

  validates :phone_number,
    format: { with: /\A\d{10}\z/, message: "bad format" },
    allow_nil: true,
    on: :update

  validates :profile_picture,
    format: { with: /\Ahttps?:\/\/.{0,}/, message: "bad format" },
    allow_nil: true,
    on: :update
  
  # if self.username.present?
  #   self.slug = username.parameterize
  # end

end

# /\A(.+)@(.+)\z/
# /\A(+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
