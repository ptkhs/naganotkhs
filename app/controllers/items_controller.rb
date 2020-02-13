class ItemsController < ApplicationController
  before_action :header_login_check
  def index
      @item = Item.new
      @items = Item.all
  end

  def show
      @item = Item.find(params[:id])
      @price_zeikomi = (@item.price * 1.10)
      @cart = Cart.new
      @categories = Category.where(available: true)
  end

  def item_params
      params.require(:item).permit(:name, :price, :discription, :image, :category_id)
  end
end
