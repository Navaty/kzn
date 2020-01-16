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
		@discounts = Discount.where(sale_id: [@sale.subtree_ids]).active.page(params[:page]) #ancestry need to optimized
			#Исправь обязательно! Сделай нормально без дырок в инъекцию.
		if params[:order]
			@discounts.order!(params[:order])
		else
			@discounts.order!('CASE WHEN adwpos IS NULL THEN 1 ELSE 0 END, adwpos')
		end
		@custom_paginate_renderer = custom_paginate_renderer
		render layout: "catalog"

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

	def destroy
		@sale = Sale.find(params[:id])
		@sale.destroy
		redirect_to sales_url, notice: 'Категория удалена.'
	end

	private
	def sale_params
		params.require(:sale).permit(:name, :parent_id)
	end
end
