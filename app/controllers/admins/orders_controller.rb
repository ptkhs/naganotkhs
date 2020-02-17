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
    @order = @orderdetail.order
    if @orderdetail.update(order_details_params)
      case @orderdetail.production_status
      when 2
        if @order.status == 1
          @order.status = 2
        end
      when 3
        @production_status = OrderDetail.where(order_id: @order.id).where.not(production_status: 3)
        if @production_status.blank?
          if @order.status == 2
            @order.status = 3
          end
        end
      end
      @order.save
      flash[:notice] = "製作ステータスを更新しました！"
      redirect_to admins_orders_show_path(@orderdetail.order_id)
    end
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    if @order.update(order_params)
      if @order.status == 1
        @order_details.each do |orderdetail|
        if orderdetail.production_status == 0
          orderdetail.update(production_status: 1)
        end
        end
      end
      end
      flash[:notice] = "注文ステータスを更新しました！"
      redirect_to admins_orders_show_path(@order)
    end

  private

  def order_params
    params.require(:order).permit(:end_user_id, :paymethod, :zipcode, :address, :name, :charge, :status, :fee, :destination, :destselect, :addressint, :allquantity)
  end

  def order_details_params
    params.require(:order_detail).permit(:item_id, :order_id, :production_status, :purchase_quantity, :purchase_price)
  end
end
