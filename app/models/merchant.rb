class Merchant < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :links
  has_many :orders

  validates :merchant_name,
    length: { minimum: 4 },
    uniqueness: true,
    allow_nil: true,
    on: :update

  validates :phone_number,
    format: { with: /\A\d{10}\z/, message: "Phone Number has a bad format. Ex: 3127894560" },
    allow_nil: true,
    on: :update

  validates :tax_id,
    length: { minimum: 6 },
    allow_nil: true,
    on: :update

  validates :description,
    length: 4..400,
    allow_nil: true,
    on: :update

  validates :profile_picture, :background_picture,
    format: { with: /\Ahttps?:\/\/.{0,}/, message: "url should start with \"http://\" or \"https://\"" },
    allow_nil: true,
    on: :update

  # puts :user

  # if self.merchant_name.present?
  #   self.slug = merchant_name.parameterize
  # end

end
