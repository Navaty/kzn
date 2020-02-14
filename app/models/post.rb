class Post < ApplicationRecord
	mount_uploaders :images, ImageUploader
	serialize :images, JSON
	belongs_to :tiding
	scope :active, -> {where(active: true)}
	scope :disactive, -> {where(active: false)}

	self.per_page = 27

end
