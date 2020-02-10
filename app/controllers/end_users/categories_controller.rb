class EndUsers::CategoriesController < ApplicationController
  def show
  	  # category_id = params[:id]
  	  @items = Item.where(category_id: params[:id])
  	  @category = Category.find(params[:id])
  	  @categories = Category.where(available: true)
  end
end
