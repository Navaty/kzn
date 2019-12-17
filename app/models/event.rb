class Event < ApplicationRecord
	has_ancestry
	has_many :places, :dependent => :destroy
end
