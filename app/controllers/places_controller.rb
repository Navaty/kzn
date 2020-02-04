class PlacesController < ApplicationController

	layout :resolve_layout

	def index
		if params[:free]
			@places = Place.active.where("title LIKE ? AND free = 't'","%#{params[:search]}%").page(params[:page])
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


	private

    def resolve_layout
	    case action_name
	    when "index"
	      "catalog_place"
	    else
	      "article"
	  end
	end
end
