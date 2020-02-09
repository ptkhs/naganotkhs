class EndUsers::TopController < ApplicationController
	before_action :header_login_check
	def index
      @end_user = current_end_user
      @items = Item.all
      @categories = Category.all
	end

	def about
	end
end
