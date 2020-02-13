class Admins::OrdersController < ApplicationController
	before_action :header_login_check
	before_action :authenticate_admin!

  def show
  	@order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @order_detail = OrderDetail.find_by(order_id: @order.id)
  end

  def index
  	@orders = Order.page(params[:page]).reverse_order
    @order_details = OrderDetail.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_detail = OrderDetail.find_by(order_id: @order.id)
    redirect_to admins_orders_index_path
  end


  private

  def order_params
    params.require(:order).permit(:end_user_id, :paymethod, :zipcode, :address, :name, :charge, :status, :fee, :destination, :destselect, :addressint, :allquantity,
      order_details_attributes: [:item_id, :order_id, :production_status, :purchase_quantity, :purchase_price])
  end
end
