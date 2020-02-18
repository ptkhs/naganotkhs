class EndUsers::CategoriesController < ApplicationController
 before_action :header_login_check
  def show
  	  # category_id = params[:id]
  	  @items = Item.where(category_id: params[:id]).page(params[:page])
  	  @items_count = Item.where(category_id: params[:id])
  	  @category = Category.find(params[:id])
  	  @categories = Category.where(available: true)
  end
end
