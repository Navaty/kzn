class Discount < ApplicationRecord
	mount_uploaders :images, ImageUploader
	serialize :images, JSON

	belongs_to :sale
	has_many :discount_addresses, dependent: :destroy

	accepts_nested_attributes_for :discount_addresses, allow_destroy: true, :reject_if => proc { |attributes| attributes['address'].blank? }


	scope :active, -> {where(active: true)}
	scope :disactive, -> {where(active: false)}

	#validates_associated :discount_addresses

	self.per_page = 4

	
end
