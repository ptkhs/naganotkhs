class EndUsers::ItemsController < ApplicationController
  def index
  	  @item = Item.new
  	  @items = Item.all
  end

  def show
  	  @item = Item.find(params[:id])
  	  @price_zeikkomi = @item.price * 1.10
  end

  def item_params
      params.require(:item).permit(:name, :price, :discription, :image)
  end
end
