class EndUsers::ItemsController < ApplicationController
  def index
  	  @item = Item.new
  	  @items = Item.all
  end

  def show
  	  @item = Item.find(params[:id])
  	  @price_zeikkomi = @item.price * 1.10
  end
end
