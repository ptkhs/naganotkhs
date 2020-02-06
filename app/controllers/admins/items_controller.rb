class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @item = Item.new
  end

  def create
  end
end
