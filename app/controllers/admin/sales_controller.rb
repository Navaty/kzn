class Admin::SalesController < Admin::AdminController

	def index
		@sales = Sale.all
	end
	def new
		@sale = Sale.new
	end
	def create
		@sale = Sale.new(sale_params)
		if @sale.save
			redirect_to admin_sales_path
		else
			render 'new'
		end
	end
	def edit
		@sale = Sale.find(params[:id]) 
	end
	def update
		@sale = Sale.find(params[:id])

		if @sale.update(sale_params)
			redirect_to admin_sales_path
		else
			render 'new'
		end
	end

	def destroy
		@sale = Sale.find(params[:id])
		@sale.destroy
		redirect_to admin_sales_path, notice: 'Категория удалена.'
	end

	private
	def sale_params
		params.require(:sale).permit(:name, :parent_id)
	end
end
