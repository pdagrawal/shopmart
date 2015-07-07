class CartsController < ApplicationController
	before_action :require_user_login
	def index
		@line_items = LineItem.all
	end

	def add_to_cart
		@current_cart.add_item_to_cart(params[:product_id], @current_cart)
		@product = Product.where(id: params[:product_id]).first
    redirect_to category_path(@product.category_id)
  end

	def show
   	@cart = @current_cart    	
  end

  def destroy
  	session[:cart_id] = nil
  	redirect_to cart_path
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