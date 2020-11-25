class Link < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :site_name, :url, :on => :create  
  
  validates :site_name,
    length: { minimum: 2 },
    on: :create

  validates :site_name,
    allow_nil: true,
    length: { minimum: 2 },
    on: :update

  validates :url,
    format: { with: /\Ahttps?:\/\/.{0,}/, message: "bad format" },
    on: :create

  validates :url,
    allow_nil: true,
    format: { with: /\Ahttps?:\/\/.{0,}/, message: "bad format" },
    on: :update

end
