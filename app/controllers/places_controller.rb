class PlacesController < ApplicationController
	layout :resolve_layout
	def index
		if params[:type].present?
			@places = Place.active.where("title LIKE ? AND free LIKE ?","%#{params[:search]}%", "#{params[:type]}").page(params[:page])
		elsif params[:search]
			@places = Place.active.where("title LIKE ?","%#{params[:search]}%").page(params[:page])
		else
			@places = Place.active.page(params[:page])
		end
		#Исправь обязательно! Сделай нормально без дырок в инъекцию.
		if params[:order]
			@places.order!(params[:order])
		else
			#@places.order!('title')
			@places.order!('CASE WHEN adwpos IS NULL THEN 1 ELSE 0 END, adwpos')
		end
		@custom_paginate_renderer = custom_paginate_renderer

		
	end

	def show
		@place = Place.find(params[:id])
	end

	def new
		@place = Place.new
	end

	def create
		@place = Place.new(place_params)

    	if @place.save
      		redirect_to @place
    	else
    	  render 'new'
 	   	end
	end

	def moder
		@places = Place.disactive
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])

		if @place.update(place_params)
			redirect_to place_path
		else
			render 'new'
		end
	end

	def destroy
		@place = place.find(params[:id])
		@place.destroy
		redirect_to places_url, notice: 'Скидка удалена.'
	end

	private
    def place_params
      params.require(:place).permit(:title, :body, :start_time, :end_time, :adress, :event_id , :active, :free, :adwpos, {images: []})
    end
    def resolve_layout
	    case action_name
	    when "index"
	      "catalog_place"
	    when "show" , "new", "create", "edit", "update"
	      "article"
	    else
	      "application"
	    end
	end
end
