class SalesController < ApplicationController
	def index
		@sales = Sale.all
	end
	def new
		@sale = Sale.new
	end
	def create
		@sale = Sale.new(sale_params)
		if @sale.save
			redirect_to sales_path
		else
			render 'new'
		end
	end
	def show
		@sale = Sale.find(params[:id])
		@discounts = Discount.where(sale_id: [@sale.subtree_ids])

	end
	def edit
		@sale = Sale.find(params[:id])
	end
	def update
		@sale = Sale.find(params[:id])

		if @sale.update(sale_params)
			redirect_to sales_path
		else
			render 'new'
		end
	end

	private
	def sale_params
		params.require(:sale).permit(:name, :parent_id)
	end
end
