class CartsController < ApplicationController
	before_action :header_login_check
	def index
	end

	def create
		@cart_item = Cart.find(cart_params[:id])
		item = current_end_user.cart.new(cart_id: cart.id)
		cart.save
		redirect_to carts_path
	end

	def update
		@cart_item = Cart.find(cart_params[:id])
		if @cart_item.update(cart_params)
			redirect_to carts_path
		else render :index
		end
	end


	def destroy
		@cart_item = Cart.find(params[:id])
		@cart_item.destroy
		redirect_to carts_path
	end


	def empty
		@cart_items = Cart.all
		@cart_items.destroy_all
		redirect_to carts_path
	end

private

	def cart_params
		params.require(:cart).permit(:item_quantity, :id, :item_id, :end_user_id)
	end



end
