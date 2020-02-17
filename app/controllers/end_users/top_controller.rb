class EndUsers::TopController < ApplicationController
	before_action :header_login_check
	def index
      @end_user = current_end_user
      @items = Item.all.order(sort_item: "DESC")
      @categories = Category.where(available: true)
	end

	def about
	end
end
