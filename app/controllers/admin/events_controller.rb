class Admin::EventsController < Admin::BaseController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  # GET /admin/events
  def index
    @events = Event.all
  end
  
  # GET /admin/events/1
  def show
  end
  
  # GET /admin/events/new
  def new
    @event = Event.new
  end
  
  # GET /admin/events/1/edit
  def edit
  end
  
  # POST /admin/events
  def create
    @event = Event.new(event_params)
    
    if @event.save
      redirect_to admin_event_path(@event), notice: 'Event was successfully created.'
    else
      flash.now[:alert] = 'Event could not be created'
      render :new
    end
  end
  
  # PATCH/PUT /admin/events/1
  def update
    if @event.update(event_params)
      redirect_to admin_event_path(@event), notice: 'Event was successfully updated.'
    else
      flash.now[:alert] = 'Event could not be updated.'
      render :edit
    end
  end
  
  # DELETE /admin/events/1
  def destroy
    @event.destroy
    redirect_to admin_events_url, notice: 'Event was successfully destroyed.'
  end
  
  private
    def set_event
      @event = Event.find(params[:id])
    end
  
    def event_params
      params.require(:event)
            .permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
    end
end
