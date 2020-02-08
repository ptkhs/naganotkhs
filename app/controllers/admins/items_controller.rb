class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @price_zeikomi = (@item.price * 1.10).to_i
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to admins_item_show_path_path(@item)
        else
            render :edit
        end
  end

  def new
    @item = Item.new
  end

  def create
      @item = Item.new(item_params)
        if @item.save
            redirect_to admins_item_show_path_path(@item)
        else
            render 'admins_item_new_path'
        end
  end

  def item_params
      params.require(:item).permit(:name, :price, :discription, :image)
  end
end