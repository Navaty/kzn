class DiscountsController < ApplicationController
	layout :resolve_layout
	def index
		@discounts = Discount.active.order('id DESC')
	end

	def show
		@discount = Discount.find(params[:id])
	end

	def new
		@discount = Discount.new
	end

	def create
		@discount = Discount.new(discount_params)

    	if @discount.save
      		redirect_to @discount
    	else
    	  render 'new'
 	   	end
	end

	def moder
		@discounts = Discount.disactive
	end

	def edit
		@discount = Discount.find(params[:id])
	end

	def update
		@discount = Discount.find(params[:id])

		if @discount.update(discount_params)
			redirect_to discount_path
		else
			render 'new'
		end
	end

	def destroy
		@discount = Discount.find(params[:id])
		@discount.destroy
		redirect_to discounts_url, notice: 'Скидка удалена.'
	end

	private
    def discount_params
      params.require(:discount).permit(:title, :body, :end_time, :adress, :sale_id , :active, :offer, {images: []})
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
