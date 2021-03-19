class OrdersController < ApplicationController

  def index
  end

  def new
  end

  def create
    @order = Order.create(order_params)

  end
  
  private

  def order_params
    params.permit(:zip_code, :state_id, :city, :house_number, :room_number, :phone_number).merge(buy_id: @buy.id)
  end

end
