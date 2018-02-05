class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:new, :create]
  
  def index
    @purchases = current_user.purchases.order(created_at: :desc)
  end

  def new
    @purchase = Purchase.new
  end
  
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user_id = current_user.id
    
    if @purchase.save
      redirect_to purchases_path, notice: 'Your order was successfully placed.'
    else
      flash.now[:alert] = 'Error placing your order.'
      render :new
    end
  end
  
  private
  
    def set_event
      @event = Event.find(params[:event_id])
    end
  
    def purchase_params
      params.require(:purchase).permit(:event_id, :ticket_quantity, :total_price)
    end
end
