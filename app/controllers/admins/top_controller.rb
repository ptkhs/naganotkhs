class Admins::TopController < ApplicationController
	before_action :header_login_check
	before_action :authenticate_admin!
	def index
		@datetime = Time.current.strftime('%Y-%m-%d')
		@orders = Order.where("created_at LIKE ?", "#{@datetime}%")
	end
end