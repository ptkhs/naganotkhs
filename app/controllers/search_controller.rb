class SearchController < ApplicationController
	before_action :header_login_check
	def index
		@categories = Category.where(available: true)
		@target = params[:target]
		if @target == 'item'
			@items = Item.search(params[:search])
		elsif
			@end_users = EndUser.search(params[:search])
			@keyword ="検索"
			render 'admins/end_users/index.html.erb'
		end
	end
end
