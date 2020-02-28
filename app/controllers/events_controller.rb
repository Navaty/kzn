class EventsController < ApplicationController
	add_breadcrumb "Главная", :root_path
	add_breadcrumb "Места", :places_path
	
	def show
		@event = Event.find(params[:id])
		@places = Place.where(event_id: [@event.subtree_ids]).active.page(params[:page])#ancestry need to optimized
		
		if params[:order]
			@places.order!(params[:order])
		else
			#@places.order!('title')
			@places.order!('CASE WHEN adwpos IS NULL THEN 1 ELSE 0 END, adwpos, updated_at DESC')
		end
		@custom_paginate_renderer = custom_paginate_renderer
		add_breadcrumb "#{@event.name}", :event_path
		render layout: "catalog_place" #ancestry need to optimized

	end
end
