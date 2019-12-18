class PostsController < ApplicationController
	layout :resolve_layout
	def index
		@posts = Post.active
	end

	def show
		@post = Post.find(params[:id])
	end

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
		@posts = Post.disactive
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to post_path
		else
			render 'new'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_url, notice: 'Скидка удалена.'
	end

	private
    def post_params
      params.require(:post).permit(:title, :body, :tiding_id , :active, {images: []})
    end
    def resolve_layout
	    case action_name
	    when "index"
	      "catalog"
	    when "show" , "new", "create", "edit", "update"
	      "article"
	    else
	      "application"
	    end
	end

end
