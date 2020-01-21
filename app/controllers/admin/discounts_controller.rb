class Admin::DiscountsController < Admin::AdminController

	#layout :resolve_layout

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
		redirect_to discounts_path, notice: 'Скидка удалена.'
	end

	private
    def discount_params
      params.require(:discount).permit(:title, :body, :end_time, :adress, :sale_id , :active, :offer, :adwpos, {images: []})
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
