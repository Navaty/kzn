class TidingsController < ApplicationController
	def index
		@tidings = Tiding.all
	end
	def new
		@tiding = Tiding.new
	end
	def create
		@tiding = Tiding.new(tiding_params)
		if @tiding.save
			redirect_to tidings_path
		else
			render 'new'
		end
	end
	def show
		@tiding = Tiding.find(params[:id])
		@posts = Post.where(tiding_id: [@tiding.subtree_ids]) #ancestry need to optimized

	end
	def edit
		@tiding = Tiding.find(params[:id])
	end
	def update
		@tiding = Tiding.find(params[:id])

		if @tiding.update(tiding_params)
			redirect_to tidings_path
		else
			render 'new'
		end
	end

	def destroy
		@tiding = Tiding.find(params[:id])
		@tiding.destroy
		redirect_to tidings_url, notice: 'Категория удалена.'
	end

	private
	def tiding_params
		params.require(:tiding).permit(:name, :parent_id)
	end
end
