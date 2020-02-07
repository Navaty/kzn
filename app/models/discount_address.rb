class DiscountAddress < ApplicationRecord
  belongs_to :discount

  geocoded_by :address

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

end
