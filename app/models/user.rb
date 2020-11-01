class User < ApplicationRecord
  has_one :merchant
  has_one :customer
  has_one :admin
  has_one :location
end
