class Admins::OrdersController < ApplicationController
	before_action :header_login_check
	before_action :authenticate_admin!
  def show
  end

  def index
  end

  def update
  end
end
