class Admin::SlidersController < Admin::AdminController
	before_action :check_admin

	def index
		@sliders = Slider.all.order('Position')
	end

	def show
		@slider = Slider.find(params[:id])
	end

	def new
		@slider = Slider.new
	end

	def create
		@slider = Slider.new(slider_params)

    	if @slider.save
      		redirect_to @slider
    	else
    	  render 'new'
 	   	end
	end

	def edit
		@slider = Slider.find(params[:id])
	end

	def update
		@slider = Slider.find(params[:id])

		if @slider.update(slider_params)
			redirect_to admin_sliders_path
		else
			render 'new'
		end
	end

	def destroy
		@slider = Slider.find(params[:id])
		@slider.destroy
		redirect_to admin_sliders_path, notice: 'Удалено.'
	end

	private
    def slider_params
      params.require(:slider).permit(:title, :description, :url , :position, :image)
    end
end
