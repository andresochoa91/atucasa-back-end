class CacheUrl < ApplicationRecord

  validates_presence_of :url, :strData  
  
  validates :url, :strData,
    length: { minimum: 2 }

end
