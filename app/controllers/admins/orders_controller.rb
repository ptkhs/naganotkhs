class Admins::OrdersController < ApplicationController
	before_action :header_login_check
	before_action :authenticate_admin!

  def show
  	@order = Order.find(params[:id])
    @order_detail = OrderDetail.where(order_id: @order.id)
  end

  def index
  	@orders = Order.page(params[:page]).reverse_order
    @order_details = OrderDetail.all
  end
  def detailup
    @orderdetail = OrderDetail.find(params[:id])

    if @orderdetail.update(order_details_params)
      flash[:notice] = "製作ステータスを更新しました！"
      redirect_to admins_orders_show_path(@orderdetail.order_id)
    end
  end
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスを更新しました！"
      redirect_to admins_orders_index_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:end_user_id, :paymethod, :zipcode, :address, :name, :charge, :status, :fee, :destination, :destselect, :addressint, :allquantity)
  end

  def order_details_params
    params.require(:order_detail).permit(:item_id, :order_id, :production_status, :purchase_quantity, :purchase_price)
  end
end
