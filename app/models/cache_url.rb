class CacheUrl < ApplicationRecord

  validates_presence_of :url, :stringified_data  
  
  validates :url, :stringified_data,
    length: { minimum: 2 }

end
