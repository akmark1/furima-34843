class ItemsController < ApplicationController

  def index
    @items = Items.all
  end

  def new
    @tweet
end
