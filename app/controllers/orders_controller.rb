class OrdersController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @orders = Order.all
    respond_with @orders
  end

  def show
    @order = Order.find(params[:id])
    respond_with @order
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      respond_to do |format|
        format.html {redirect_to orders_path, notice: "The order was created."}
        format.json {render json: @order}
        format.xml {render xml: @order}
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:notice] = "The item was not created."
          render :ne
        end
        format.json {render json: @order}
        format.xml {render xml: @order}
      end
    end
  end

  def edit
    @order = Order.find_by(id: params[:id])
  end

  def update
    
  end
  private

  def order_params
    params.require(:order).permit(:amount)
  end
end
