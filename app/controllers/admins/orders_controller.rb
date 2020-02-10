class Admins::OrdersController < ApplicationController
	before_action :header_login_check
	before_action :authenticate_admin!
  def show
  	@order = Order.find(params[:id])
  end

  def index
  	@orders = Order.page(params[:page]).reverse_order
  end

  def update
  end
end
