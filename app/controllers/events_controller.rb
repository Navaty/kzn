class EventsController < ApplicationController
	def index
		@events = Event.all
	end
	def new
		@event = Event.new
	end
	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to events_path
		else
			render 'new'
		end
	end
	def show
		@event = Event.find(params[:id])
		@places = Place.where(event_id: [@event.subtree_ids]).active.page(params[:page])
		if params[:order]
			@places.order!(params[:order])
		else
			#@places.order!('title')
			@places.order!('CASE WHEN adwpos IS NULL THEN 1 ELSE 0 END, adwpos')
		end
		@custom_paginate_renderer = custom_paginate_renderer
		render layout: "catalog_place" #ancestry need to optimized

	end
	def edit
		@event = Event.find(params[:id])
	end
	def update
		@event = Event.find(params[:id])

		if @event.update(event_params)
			redirect_to events_path
		else
			render 'new'
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_url, notice: 'Категория удалена.'
	end

	private
	def event_params
		params.require(:event).permit(:name, :parent_id)
	end
end
