class Admins::CategoriesController < ApplicationController
  before_action :header_login_check
  def index
  　　@category = Category.new
  　　@categories = Category.all
      @end_user = current_end_user
  end

  def edit
  	  @category = Category.find(params[:id])
  end

  def update
  	  @category = Category.find(params[:id])
	  @category.update(category_params)
  	  redirect_to admins_categories_path(@category)
  end

  def create
  	  @category = Category.new(category_params)
  	  @category.save
  	  redirect_to admins_categories_path
  end

  def category_params
  	  params.require(:category).permit(:name, :available)
  end
end
