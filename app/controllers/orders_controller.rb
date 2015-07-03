class OrdersController < ApplicationController

	def create
		if Cart.where("id = ?", session[:cart_id]).last.line_items.blank?
			flash[:danger] = "Add some item before placing order"
			redirect_to root_path
		else
			@order = Order.new
			@line_items = Cart.where("user_id = ?", current_user.id).last.line_items
			@line_items.each do |item|
				@order.line_items << item
			end
			@order.status = "Placed"
			if @order.save
				flash[:success] = "Your Order has successfully placed"
	      session[:cart_id] = nil
	      redirect_to order_path(@order.id)
	    end
		end
	end

	def show
		@order = Order.find(params[:id])
	end
end
