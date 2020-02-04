class WellcomeController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	layout 'map', :only => :map

	def index
		@discounts = Discount.active.order('CASE WHEN adwpos IS NULL THEN 1 ELSE 0 END, adwpos').limit(9)
		@places = Place.limit(9)
		@posts = Post.limit(9)
	end

	def show
		
	end

	def map

		render 'map'
	end
end

