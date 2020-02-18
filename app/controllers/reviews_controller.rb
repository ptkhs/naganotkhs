class ReviewsController < ApplicationController
	before_action :header_login_check
	def index
		@orders = Order.where.not(review: nil)
	end

	def pos
		@order = Order.find(params[:order_id])
	end

	def update
		@order = Order.find(params[:order_id])
		if @order.update(order_params)
			flash[:notice] = 'レビューを送信しました'
			redirect_to review_path
		else
			flash[:notice] = 'レビューの送信に失敗しました'
			render :send
		end
	end

	private

	def order_params
    params.require(:order).permit(:star, :review)
  end
end