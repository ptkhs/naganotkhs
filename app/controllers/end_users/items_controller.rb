class EndUsers::ItemsController < ApplicationController
	before_action :header_login_check
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
