class PostsController < ApplicationController

	layout :resolve_layout

	def index
		if params[:search]
			@posts = Post.active.where("title LIKE ?","%#{params[:search]}%").page(params[:page])
		else
			@posts = Post.active.page(params[:page])
		end
		#Исправь обязательно! Сделай нормально без дырок в инъекцию.
		if params[:order]
			@posts.order!(params[:order])
		else
			#@posts.order!('title')
			@posts.order!('CASE WHEN adwpos IS NULL THEN 1 ELSE 0 END, adwpos, updated_at DESC')
		end
		@custom_paginate_renderer = custom_paginate_renderer

		
	end

	def show
		@post = Post.find(params[:id])
	end


	private
    
	 	 def resolve_layout
		    case action_name
		    when "index"
		      "catalog_posts"
		    else
		      "article"
		  end
		end

end
