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
end
