class Admins::CategoriesController < ApplicationController
	before_action :authenticate_admin!
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
		if @category.update(category_params)
			flash[:notice] = 'ジャンルの編集に成功しました。'
			redirect_to admins_categories_path(@category)
		else
			flash[:notice] = 'ジャンルの編集に失敗しました。'
		end
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = 'ジャンルの編集に成功しました。'
			redirect_to admins_categories_path
		else
			flash[:notice] = 'ジャンルの新規作成に失敗しました。'
			redirect_to admins_categories_path
		end
	end

	def category_params
		params.require(:category).permit(:name, :available)
	end
end
