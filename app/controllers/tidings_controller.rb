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
		@posts = Post.where(tiding_id: [@tiding.subtree_ids]).page(params[:page]) #ancestry need to optimized
		if params[:order]
			@posts.order!(params[:order])
		else
			#@posts.order!('title')
			@posts.order!('CASE WHEN adwpos IS NULL THEN 1 ELSE 0 END, adwpos')
		end
		@custom_paginate_renderer = custom_paginate_renderer
		render layout: "catalog_posts"

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
