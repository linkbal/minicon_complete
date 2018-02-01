class Admin::EventCategoriesController < Admin::BaseController
  before_action :set_event_category, only: [:show, :edit, :update, :destroy]
  
  # GET /admin/event_categories
  def index
    @event_categories = EventCategory.all
  end
  
  # GET /admin/event_categories/1
  def show
  end
  
  # GET /admin/event_categories/new
  def new
    @event_category = EventCategory.new
  end
  
  # GET /admin/event_categories/1/edit
  def edit
  end
  
  # POST /admin/event_categories
  def create
    @event_category = EventCategory.new(event_category_params)
    
    if @event_category.save
      redirect_to admin_event_category_path(@event_category), notice: 'Event category was successfully created.'
    else
      flash.now[:alert] = 'Event category could not be created.'
      render :new
    end
  end
  
  # PATCH/PUT /admin/event_categories/1
  def update
    if @event_category.update(event_category_params)
      redirect_to admin_event_category_path(@event_category), notice: 'Event category was successfully updated.'
    else
      flash.now[:alert] = 'Event category could not be updated.'
      render :edit
    end
  end
  
  # DELETE /admin/event_categories/1
  def destroy
    @event_category.destroy
    redirect_to admin_event_categories_url, notice: 'Event category was successfully destroyed.'
  end
  
  private
    def set_event_category
      @event_category = EventCategory.find(params[:id])
    end
    
    # Never trust parameters from the Internet. Specify the ones allowed
    def event_category_params
      params.require(:event_category).permit(:name, :description)
    end
end
