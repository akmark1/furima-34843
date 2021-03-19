class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_order = BuyOrder.new
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_order = BuyOrder.new(buy_params)
    if @buy_order.valid?
      pay_item
      @buy_order.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def buy_params
    params.require(:buy_order).permit(:zip_code, :state, :city, :house_number, :room_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.value,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

end
