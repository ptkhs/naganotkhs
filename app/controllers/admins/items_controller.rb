class Admins::ItemsController < ApplicationController
  before_action :header_login_check
  before_action :authenticate_admin!
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @price_zeikomi = (@item.price * 1.10).to_i
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admins_item_show_path_path(@item)
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
      @item = Item.new(item_params)
      @item.save
      redirect_to admins_item_show_path_path(@item)
  end

  def item_params
      params.require(:item).permit(:name, :price, :discription, :image, :category_id, :status)
  end
end
