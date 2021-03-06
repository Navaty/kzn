class TidingsController < ApplicationController
	add_breadcrumb "Главная", :root_path
	add_breadcrumb "Новости", :posts_path	
	def show
		@tiding = Tiding.find(params[:id])
		@posts = Post.where(tiding_id: [@tiding.subtree_ids]).page(params[:page]) #ancestry need to optimized
		if params[:order]
			@posts.order!(params[:order])
		else
			#@posts.order!('title')
			@posts.order!('CASE WHEN adwpos IS NULL THEN 1 ELSE 0 END, adwpos, updated_at DESC')
		end
		@custom_paginate_renderer = custom_paginate_renderer
		add_breadcrumb "#{@tiding.name}", :tiding_path
		render layout: "catalog_posts"

	end

end
