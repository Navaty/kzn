class SalesController < ApplicationController
	add_breadcrumb "Главная", :root_path
	add_breadcrumb "Скидки", :discounts_path
	def show
		@sale = Sale.find(params[:id])
		@discounts = Discount.where(sale_id: [@sale.subtree_ids]).active.page(params[:page]) #ancestry need to optimized
			#Исправь обязательно! Сделай нормально без дырок в инъекцию.
		if params[:order]
			@discounts.order!(params[:order])
		else
			@discounts.order!('CASE WHEN adwpos IS NULL THEN 1 ELSE 0 END, adwpos, updated_at DESC')
		end
		@custom_paginate_renderer = custom_paginate_renderer

		add_breadcrumb "#{@sale.name}", :sale_path
		render layout: "catalog"

	end
end
