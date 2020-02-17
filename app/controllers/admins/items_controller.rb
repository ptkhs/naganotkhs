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
    if @item.update(item_params)
      redirect_to admins_item_show_path_path(@item)
    else
      @item = Item.find(params[:id])
      @categories = Category.all
      render :edit
    end
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to admins_items_path
      else
        @item = Item.new
        @categories = Category.all
        render :new
      end
  end

  def item_params
      params.require(:item).permit(:name, :price, :discription, :image, :category_id, :status)
  end
end
