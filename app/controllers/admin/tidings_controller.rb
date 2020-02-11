class Admin::TidingsController < Admin::AdminController

	def index
		@tidings = Tiding.all
	end
	def new
		@tiding = Tiding.new
	end
	def create
		@tiding = Tiding.new(tiding_params)
		if @tiding.save
			redirect_to admin_tidings_path
		else
			render 'new'
		end
	end
	def edit
		@tiding = Tiding.find(params[:id])
	end
	def update
		@tiding = Tiding.find(params[:id])

		if @tiding.update(tiding_params)
			redirect_to admin_tidings_path
		else
			render 'new'
		end
	end

	def destroy
		@tiding = Tiding.find(params[:id])
		@tiding.destroy
		redirect_to admin_tidings_path, notice: 'Категория удалена.'
	end

	private
	def tiding_params
		params.require(:tiding).permit(:name, :parent_id, :mtitle, :mdescription)
	end
end
