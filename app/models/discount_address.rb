class DiscountAddress < ApplicationRecord
  belongs_to :discount

  geocoded_by :address

  after_validation :geocode

end
