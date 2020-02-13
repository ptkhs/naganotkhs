class CartsController < ApplicationController
	before_action :header_login_check
	def index
		@cart_total_price = 0
		@cart_items = current_end_user.carts
	  @cart_items.each do |cart|
		@cart_total_price += (cart.item.price) * (cart.item_quantity) * 1.10
	  end
	end

	def create
		@cart_item = current_end_user.carts.find_by(item_id: params[:id])
	  if @cart_item.blank?
		item = Item.find(params[:id])
		cart_item = Cart.new(item_id:item.id,end_user_id:current_end_user.id,item_quantity:params[:cart][:item_quantity])
		cart_item.save
		redirect_to carts_path
	  else
	    @cart_item.item_quantity += 1
		@cart_item.save
		redirect_to carts_path
	  end
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
		@cart_items = Cart.where(end_user_id:current_end_user)
		@cart_items.destroy_all
		redirect_to carts_path
	end

private

	def cart_params
		params.require(:cart).permit(:item_quantity, :id, :item_id, :end_user_id)
	end



end
