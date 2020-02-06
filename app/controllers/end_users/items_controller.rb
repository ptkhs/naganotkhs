class EndUsers::ItemsController < ApplicationController
  def index
  	  @newitem = Item.new
  	  @item = Item.all
  end

  def show
  end
end
