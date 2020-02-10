class Page < ApplicationRecord
	mount_uploaders :images, ImageUploader
	serialize :images, JSON

	validates_uniqueness_of :url
	validates_format_of :url, :without => /\A\d/
  
	  def to_param
	    url
	  end

	  def self.find(input)
	    input.to_i == 0 ? find_by_url(input) : super
	  end
end
