class Admin::PostsController < Admin::AdminController

	#layout :resolve_layout

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

    	if @post.save
      		redirect_to @post
    	else
    	  render 'new'
 	   	end
	end

	def moder
		if params[:search]
			@posts = Post.disactive.where("title LIKE ?","%#{params[:search]}%").page(params[:page])
		else
			@posts = Post.disactive.page(params[:page])
		end
		@custom_paginate_renderer = custom_paginate_renderer
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to admin_posts_path
		else
			render 'new'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, notice: 'Скидка удалена.'
	end

	private
    def post_params
      params.require(:post).permit(:title, :body, :tiding_id , :active, :adwpos, {images: []})
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
