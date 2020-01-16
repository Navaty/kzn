class DiscountsController < ApplicationController
	layout :resolve_layout
	def index
		#Перекинь в модель
		if params[:type].present?
			@discounts = Discount.active.where("title LIKE ? AND offer LIKE ?","%#{params[:search]}%", "#{params[:type]}").page(params[:page])
		elsif params[:search]
			@discounts = Discount.active.where("title LIKE ?","%#{params[:search]}%").page(params[:page])
		else
			@discounts = Discount.active.page(params[:page])
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
      params.require(:discount).permit(:title, :body, :end_time, :adress, :sale_id , :active, :offer, :adwpos, {images: []})
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
