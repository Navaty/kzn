class Admin::PlacesController < Admin::AdminController
	
	#layout :resolve_layout


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
		if params[:free]
			@places = Place.disactive.where("title LIKE ? AND free = 't'","%#{params[:search]}%").page(params[:page])
		elsif params[:search]
			@places = Place.disactive.where("title LIKE ?","%#{params[:search]}%").page(params[:page])
		else
			@places = Place.disactive.page(params[:page])
		end
		@custom_paginate_renderer = custom_paginate_renderer
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])

		if @place.update(place_params)
			redirect_to admin_places_path
		else
			render 'new'
		end
	end

	def destroy
		@place = place.find(params[:id])
		@place.destroy
		redirect_to places_path, notice: 'Скидка удалена.'
	end

	private
    def place_params
      params.require(:place).permit(:title, :body, :start_time, :end_time, :adress, :event_id , :active, :free, :adwpos, {images: []})
    end
    def resolve_layout
	    case action_name
	    when "moder"
	    	"application"
	    else
	    	"article"
	    end
	end
end
