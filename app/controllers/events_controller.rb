class EventsController < ApplicationController
	
	def show
		@event = Event.find(params[:id])
		@places = Place.where(event_id: [@event.subtree_ids]).active.page(params[:page])
		
		if params[:order]
			@places.order!(params[:order])
		else
			#@places.order!('title')
			@places.order!('CASE WHEN adwpos IS NULL THEN 1 ELSE 0 END, adwpos, updated_at DESC')
		end
		@custom_paginate_renderer = custom_paginate_renderer
		render layout: "catalog_place" #ancestry need to optimized

	end
end
