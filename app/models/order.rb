class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :product_orders
  has_many :products, through: :product_orders

  validates :current_user,
    presence: true,
    inclusion: { in: %w(customer merchant) }

  validates :delivery_fee,
    numericality: { more_than: 0 }
  
end
