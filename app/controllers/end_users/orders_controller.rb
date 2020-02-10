class EndUsers::OrdersController < ApplicationController
  before_action :header_login_check
  before_action :authenticate_end_user!
  def confirm
    @order = Order.find(params[:id])
    @carts = Cart.all
    # 仮
  end

  def new
    @order = Order.new
    if :destination == "1"
      :zipcode = current_end_user.zipcode
      :address = current_end_user.address
      :name = current_end_user.lastname + current_end_user.firstname
    elsif :destination == "2"
      :zipcode = current_end_user.destinations.zipcode
      :address = current_end_user.destinations.address
      :name = current_end_user.destinations.name
    else :destination == "3"
    end
  end

  def show
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
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
    params.require(:order).permit(:end_user_id, :paymethod, :zipcode, :address, :name, :charge, :status, :fee, :destination)
  end
end
