class DiscountsController < ApplicationController
	def index
		@discounts = Discount.all
	end

	def new
		@discount = Discount.new
	end

	def create
		@discount = Discount.new(discount_params)

    	if @discount.save
      		redirect_to discounts_path
    	else
    	  render 'new'
 	   	end
	end

	def show
		@discount = Discount.find(params[:id])
	end

	private
    def discount_params
      params.require(:discount).permit(:title, :body, :end_time, :adress, :sale_id , :active, :offer, {avatars: []})
    end

end
