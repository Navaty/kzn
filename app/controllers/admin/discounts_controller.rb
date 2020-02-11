class Admin::DiscountsController < Admin::AdminController

	#layout :resolve_layout
		before_action :check_admin, only: [:destroy]

	def new
		@discount = Discount.new

	end

	def create
		#raise params.inspect
		@discount = Discount.new(discount_params)

    	if @discount.save
      		redirect_to @discount
    	else
    	  render 'new'
 	   	end
	end

	def moder
		if params[:type].present?
			@discounts = Discount.disactive.where("title LIKE ? AND offer LIKE ?","%#{params[:search]}%", "#{params[:type]}").page(params[:page])
		elsif params[:search]
			@discounts = Discount.disactive.where("title LIKE ?","%#{params[:search]}%").page(params[:page])
		else
			@discounts = Discount.disactive.page(params[:page])
		end
		#Исправь обязательно! Сделай нормально без дырок в инъекцию.

		@custom_paginate_renderer = custom_paginate_renderer
	end

	def edit
		@discount = Discount.find(params[:id])
	end

	def update
		#raise params.inspect
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
		redirect_to discounts_path, notice: 'Скидка удалена.'
	end

	private
    def discount_params
      params.require(:discount).permit(:title, :body, :end_time, :adress, :sale_id , :active, :offer, :adwpos, :mtitle, :mdescription,
      	{images: []}, discount_addresses_attributes: [:address, :id, :_destroy])
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
