class DiscountsController < ApplicationController

	layout :resolve_layout

	def index
		#Перекинь в модель
		if params[:type].present?
			@discounts = Discount.active.where("title LIKE ? AND offer LIKE ?","%#{params[:search]}%", "#{params[:type]}").page(params[:page]).order('updated_at DESC')
		elsif params[:search]
			@discounts = Discount.active.where("title LIKE ?","%#{params[:search]}%").page(params[:page]).order('updated_at DESC')
		else
			@discounts = Discount.active.page(params[:page]).order('updated_at DESC')
		end
		#Исправь обязательно! Сделай нормально без дырок в инъекцию.
		if params[:order]
			@discounts.order!(params[:order])
		else
			@discounts.order!('CASE WHEN adwpos IS NULL THEN 1 ELSE 0 END, adwpos')
		end
		@custom_paginate_renderer = custom_paginate_renderer
	end

	def show
		@discount = Discount.find(params[:id])
	end

	private

    def resolve_layout
	    case action_name
	    when "index"
	      "catalog"
	    else
	      "article"
	  end
	end

end
