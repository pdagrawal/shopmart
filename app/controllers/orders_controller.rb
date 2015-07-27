class OrdersController < ApplicationController
  before_action :require_user_login
  def new
    unless Cart.find(session[:cart_id]).line_items.blank?
      @order = Order.new
    else
      flash[:danger] = "Add some item before placing order"
      redirect_to root_path
    end
  end
  
  def create
    @cart = Cart.find(session[:cart_id])
    @order = Order.new(user_id: current_user.id, total: @cart.total, address: params[:order][:address], status: "Placed")
    @cart.line_items.each do |item|
      @order.line_items << item
    end
    if @order.save
      @order.create_activity :create, owner: current_user
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
