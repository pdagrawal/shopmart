class CartsController < ApplicationController
	before_action :require_user_login
	def index
		@line_items = LineItem.all
	end

	def add_to_cart
		@current_cart.add_item_to_cart(params[:product_id], @current_cart, @current_user)
    flash[:success] = "Product id successfully addede to cart"
    redirect_to category_path(Product.find(params[:product_id]).category_id)
  end

	def show
    @current_cart.total = @current_cart.line_items.to_a.sum { |item| line_total = item.product.price*item.quantity }
    @current_cart.save
  end

  def destroy
  	session[:cart_id] = nil
  	redirect_to cart_path
  end

end