class Admins::TopController < ApplicationController
	before_action :authenticate_admin!
	def index
		render layout: false
	end
end
