class OrdersController < ApplicationController
	def index
		@order = current_user.orders
	end

	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		
		@order.save
		#NotificationMailer.order_confirmation(@order).deliver!

		redirect_to orders_path, notice: "Order has been placed successfully"
	end

	def show

	end

	private

	def order_params
		params[:order].permit(:address_id)	
	end
end
