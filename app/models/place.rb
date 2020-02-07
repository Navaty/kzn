class Place < ApplicationRecord
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  belongs_to :event
  scope :active, -> {where(active: true)}
  scope :disactive, -> {where(active: false)}
 
  geocoded_by :adress

  after_validation :geocode, if: ->(obj){ obj.adress.present? and obj.adress_changed? }
  
  self.per_page = 4
end
