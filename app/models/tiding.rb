class Tiding < ApplicationRecord
	has_ancestry
	has_many :posts
end
