class Admins::CartsController < ApplicationController
	before_action :authenticate_admin!
	before_action :header_login_check
end
