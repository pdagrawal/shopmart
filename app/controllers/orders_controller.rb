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
    @order = Order.new(user_id: current_user.id, address: params[:order][:address])
    @line_items = Cart.find(session[:cart_id]).line_items
    @line_items.each do |item|
      @order.line_items << item
    end
    if @order.save
      @order.status = "Placed"
      @order.save
      flash[:success] = "Your Order has successfully placed"
      session[:cart_id] = nil
      redirect_to order_path(@order.id)
    end
  end

  def show
    @order = Order.find(params[:id])
  end
  private
  def require_user_login
    unless user_signed_in?
      flash[:danger] = "You must be logged in to access this section"
      redirect_to new_user_session_path
    else
      @current_cart = current_cart
    end
  end
end
