class Sale < ApplicationRecord
	has_ancestry
	has_many :discounts, :dependent => :destroy
end
