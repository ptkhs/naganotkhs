class CartsController < ApplicationController
	before_action :header_login_check
	def index
	end

	def create
	end

	def update
		@cart_item = Cart.find(cart_params[:id])
		if @cart_item.update(cart_params)
			redirect_to carts_path
		else render :index
		end
	end


	def destroy
	end


	def empty
	end

private

	def cart_params
		params.require(:cart).permit(:item_quantity, :id)
	end


	private




end
