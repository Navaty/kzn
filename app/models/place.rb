class Place < ApplicationRecord
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  belongs_to :event
  scope :active, -> {where(active: true)}
  scope :disactive, -> {where(active: false)}

  self.per_page = 4
end
