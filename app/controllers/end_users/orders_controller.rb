class EndUsers::OrdersController < ApplicationController
  before_action :authenticate_end_user!
  def confirm
  end

  def new
    @order = Order.new
    @end_user = current_end_user
    @end_user_info = @end_user.address,@end_user.zipcode
    @destination = @end_user.destinations

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
  # def send後で入れる

  private
  def order_params
    params_require(:order).permit(:end_user_id, :paymethod, :zipcode, :address, :name, :charge, :status, :fee)
  end
end
