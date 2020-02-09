class Admins::TopController < ApplicationController
	before_action :header_login_check
	before_action :authenticate_admin!
	def index
	end
end
