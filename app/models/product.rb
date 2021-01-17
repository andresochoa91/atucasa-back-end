class Product < ApplicationRecord
  belongs_to :merchant
  has_many :product_orders
  has_many :orders, through: :product_orders

  validates :product_name,
    presence: true,
    length: 2..50,
    on: :create

  validates :product_name,
    length: 2..50,
    allow_nil: true,
    on: :update

  validates :description,
    length: 2..400,
    allow_nil: true,
    allow_blank: true,
    on: :update

  validates :price,
    numericality: { less_than: 1001, greater_than: 0 },
    presence: true,
    on: :create

  validates :price,
    numericality: { less_than: 1001, greater_than: 0 },
    allow_nil: true,
    allow_blank: true,
    on: :update

  validates :tax,
    presence: true,
    on: :create

  validates :product_picture,
    format: { with: /\Ahttps?:\/\/.{0,}/, message: "url should start with \"http://\" or \"https://\"" },
    allow_nil: true,
    allow_blank: true

end
