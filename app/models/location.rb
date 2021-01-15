class Location < ApplicationRecord
  belongs_to :user
  # validates_length_of :country, :state, :city,
  #   :minimum => 2,
  #   :presence => true,
  #   :on => :create

  validates_length_of :country, 
    :minimum => 2,
    :allow_nil => true,
    :on => :update  

  validates :zip_code,
    length: { is: 5 },
    allow_nil: true,
    on: :update
    
  validates :address,
    length: { minimum: 5 },
    allow_nil: true,
    on: :update
    
  validates :details,
    length: { maximum: 200 },
    allow_nil: true,
    on: :update 

end
