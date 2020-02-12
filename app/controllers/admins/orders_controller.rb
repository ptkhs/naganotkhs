class Admins::OrdersController < ApplicationController
	before_action :header_login_check
	before_action :authenticate_admin!
  def show
  	@order = Order.find(params[:id])
    @item = @order.end_users.carts.item
  end

  def index
  	@orders = Order.page(params[:page]).reverse_order
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_orders_index_path
  end

  private

  def order_params
    params.require(:order).permit(:end_user_id, :paymethod, :zipcode, :address, :name, :charge, :status, :fee, :destination, :destselect, :addressint)
  end
end
