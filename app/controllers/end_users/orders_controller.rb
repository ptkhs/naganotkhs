class EndUsers::OrdersController < ApplicationController
  before_action :header_login_check
  before_action :authenticate_end_user!
  def confirm
    @order = Order.find(order_params)
    @carts = Cart.all
    # 仮
  end

  def new
    @order = Order.new
  end

  def show
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    case @order.destselect
    when 1
      @order.address = current_end_user.address
      @order.zipcode = current_end_user.zipcode
      @order.name = current_end_user.lastname + current_end_user.firstname
    when 2
      @order.address = Destination.find(@order.addressint).address
      @order.zipcode = Destination.find(@order.addressint).zipcode
      @order.name = Destination.find(@order.addressint).name
    end
    @buying_items = current_end_user.carts
    @order.end_user_id = current_end_user.id
    @order.fee = 800
    @order.save
    redirect_to orders_confirm_path
  end

  def index
  end

  def sending
    @order = Order.find(params[:id])
    redirect_to confirm_path
  end

  private
  def order_params
    params.require(:order).permit(:end_user_id, :paymethod, :zipcode, :address, :name, :charge, :status, :fee, :destination, :destselect, :addressint)
  end
end
