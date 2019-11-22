class Discount < ApplicationRecord
	mount_uploaders :images, ImageUploader
	serialize :images, JSON
	belongs_to :sale
end
