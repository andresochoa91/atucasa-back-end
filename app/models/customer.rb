class Customer < ApplicationRecord
  belongs_to :user
  # validates_presence_of :username
  # validates_uniqueness_of :username

  # validates :username,
  #   length: 3..20,
  #   uniqueness: true

  # validates :phone_number,
  #   format: { with: /\A\d{10}\z/, message: "bad format" }  
  #   # allow_nil: true

end

# /\A(.+)@(.+)\z/
# /\A(+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
