class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :product_name,
    presence: true,
    length: 2..50,
    on: :create

  validates :product_name,
    allow_nil: true,
    length: 2..50,
    on: :update

  validates :price,
    numericality: { less_than: 1001 },
    presence: true,
    on: :create

  validates :price,
    allow_nil: true,
    numericality: { less_than: 1001 },
    on: :update

  validates :amount,
    presence: true,
    numericality: { greater_than: 0, less_than: 20 },
    on: :create

  validates :amount,
    allow_nil: true,
    numericality: { greater_than: -1, less_than: 20 },
    on: :update

end
