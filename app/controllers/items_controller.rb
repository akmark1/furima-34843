class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end
  
  def create
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_id, :state_id, :delivery_day_id, :value).merge(user_id: current_user.id)
  end
end
