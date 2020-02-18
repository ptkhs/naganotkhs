class Admins::SalesController < ApplicationController
	before_action :header_login_check
	before_action :authenticate_admin!
	def index
	end
	def view
		case params[:method]
		when "1"
			to = Time.current
			case params[:between]
			when "1"
				from = Time.current.strftime('%Y-%m-%d')
				b_from = (Time.current - 1.days).strftime('%Y-%m-%d')
				@label1="今日"
				@label2="昨日"
				@label3="前日比"
			when "2"
				from = to.beginning_of_week(start_day = :sunday)
				b_from = (Time.current - 1.weeks).beginning_of_week(start_day = :sunday)
				@label1="今週"
				@label2="先週"
				@label3="前週比"
			when "3"
				from = to.beginning_of_month
				b_from = (Time.current - 1.months).beginning_of_month
				@label1="今月"
				@label2="先月"
				@label3="前月比"
			when "4"
				from = to.beginning_of_year
				b_from = (Time.current - 1.years).beginning_of_year
				@label1="今年"
				@label2="昨年"
				@label3="前年比"
			end
			@orders = Order.where(:created_at=> from..to)
			@last_orders = Order.where(:created_at=> b_from..from)
			@charge_sum = 0
			@orders.each do |order|
				@charge_sum += order.charge
			end
			@last_charge_sum = 0
			@last_orders.each do |lastorder|
				@last_charge_sum += lastorder.charge
			end
			@dif = @charge_sum - @last_charge_sum
			@orders_count = @orders.count
			@last_orders_count = @last_orders.count
			@count_dif = @orders_count - @last_orders_count
		when "2"
			from = params[:start_day]
			to = params[:finish_day]
		end
			@orders = Order.where(:created_at=> from..to)
			@charge_sum = 0
			@orders.each do |order|
				@charge_sum += order.charge
			end
			@orders_count = @orders.count
	end
end
