class Merchant < ApplicationRecord
  belongs_to :user

  validates :merchant_name,
    length: { minimum: 3 },
    uniqueness: true,
    allow_nil: true,
    on: :update

  validates :phone_number,
    format: { with: /\A\d{10}\z/, message: "bad format" },
    allow_nil: true,
    on: :update

  validates :legal_id,
    length: { minimum: 6 },
    allow_nil: true,
    on: :update

  validates :description,
    length: 20..400,
    allow_nil: true,
    on: :update

  # puts :user

  # if self.merchant_name.present?
  #   self.slug = merchant_name.parameterize
  # end

end
