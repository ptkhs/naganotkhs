class EndUsers::OrdersController < ApplicationController
  before_action :header_login_check
  before_action :authenticate_end_user!
  def confirm
  end

  def new
    @pre_order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def thanks
  end

  def create
    @pre_order = Order.new(order_params)
    case @pre_order.destselect
    when 1
      @pre_order.address = current_end_user.address
      @pre_order.zipcode = current_end_user.zipcode
      @pre_order.name = current_end_user.lastname + current_end_user.firstname

    when 2
      @pre_order.address = Destination.find(@pre_order.addressint).address
      @pre_order.zipcode = Destination.find(@pre_order.addressint).zipcode
      @pre_order.name = Destination.find(@pre_order.addressint).name
    end
    @buying_items = current_end_user.carts
    @pre_order.end_user_id = current_end_user.id
    @pre_order.fee = 800
    @buying_item_price = 0
    @buying_items.each do |cart|
        @buying_item_price += (cart.item_quantity) * (cart.item.price) * 1.10
      end
    @total_price = @pre_order.fee + @buying_item_price
    @pre_order.charge = @total_price
    @pre_order.status = 0
        render :confirm
    end


  def index
    @orders = Order.page(params[:page]).reverse_order
    @order_details = OrderDetail.all
  end

  def sending
    @order = Order.new
    @order.end_user_id = params[:order][:end_user_id]
    @order.paymethod = params[:order][:paymethod]
    @order.zipcode = params[:order][:zipcode]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
    @order.charge = params[:order][:charge]
    @order.fee = params[:order][:fee]
    @order.save
    @carts = Cart.where(end_user_id: current_end_user.id)
    @carts.each do |cart|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart.item_id
      @order_detail.order_id = @order.id
      @order_detail.purchase_quantity = cart.item_quantity
      @order_detail.purchase_price = cart.item.price
      @order_detail.save
    end
    @carts = Cart.where(end_user_id: current_end_user.id)
    @carts.each do |cart|
      cart.destroy
    end
    redirect_to orders_thanks_path
  end

  private
  def order_params
    params.require(:order).permit(:end_user_id, :paymethod, :zipcode, :address, :name, :charge, :status, :fee, :destination, :destselect, :addressint)
  end
end
