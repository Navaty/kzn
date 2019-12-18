class WellcomeController < ApplicationController
	def index
		@discounts = Discount.active.limit(9)
		@places = Place.limit(9)
		@posts = Post.limit(9)
	end

	def show
		
	end
end

