class Admin::PagesController < Admin::AdminController

		before_action :check_admin


	def index
		@pages = Page.all
	end

	def new
		@page = Page.new

	end

	def create
		@page = Page.new(page_params)

    	if @page.save
      		redirect_to @page
    	else
    	  render 'new'
 	   	end
	end

	def edit
		@page = Page.find(params[:id])
	end

	def update
		#raise params.inspect
		@page = Page.find(params[:id])

		if @page.update(page_params)
			redirect_to page_path
		else
			render 'new'
		end
	end

	def destroy
		@page = Page.find(params[:id])
		@page.destroy
		redirect_to pages_path, notice: 'Скидка удалена.'
	end

	private
    def page_params
      params.require(:page).permit(:title, :body, :url, :mtitle, :mdescription, {images: []})
    end

end
