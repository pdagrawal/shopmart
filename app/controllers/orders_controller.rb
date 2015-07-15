class OrdersController < ApplicationController
  before_action :require_user_login
  def new
    if Cart.find(session[:cart_id]).line_items.blank?
      flash[:danger] = "Add some item before placing order"
      redirect_to root_path
    else
      @order = Order.new
    end
  end
  
  def create
    @order = Order.new(user_id: current_user.id, address: params[:order][:address], status: "Placed")
    Cart.find(session[:cart_id]).line_items.each do |item|
      @order.line_items << item
    end
    if @order.save
      flash[:success] = "Your Order has successfully placed"
      session[:cart_id] = nil
      redirect_to order_path(@order.id)
    else
      render "new"
    end
  end

  def show
    @order = Order.find(params[:id])
  end
  
end
