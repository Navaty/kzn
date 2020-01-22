class Admin::EventsController < Admin::AdminController
	
	
	def index
		@events = Event.all
	end
	def new
		@event = Event.new
	end
	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to admin_events_path
		else
			render 'new'
		end
	end
	def edit
		@event = Event.find(params[:id])
	end
	def update
		@event = Event.find(params[:id])

		if @event.update(event_params)
			redirect_to admin_events_path
		else
			render 'new'
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to admin_events_path, notice: 'Категория удалена.'
	end

	private
	def event_params
		params.require(:event).permit(:name, :parent_id)
	end
end
