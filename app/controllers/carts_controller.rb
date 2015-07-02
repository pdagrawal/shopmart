class CartsController < ApplicationController
	def index
		@carts = Cart.all
		@line_items = LineItem.all
	end

	def new
	end

	def current_cart
		if session[:cart_id].nil?
	    @current_cart = Cart.create
	    session[:cart_id] = @current_cart.id
	    @current_cart.user_id = current_user.id
	  end
	  if session[:cart_id]
	    @current_cart = Cart.where("id = ?", session[:cart_id]).last
	    @current_cart.user_id = current_user.id
	  end
	  @current_cart
  end

	def add_to_cart
  	if user_signed_in?
  		current_user.cart_id = current_cart.id
  		line_item = current_cart.line_items.where('product_id = ? AND cart_id = ?', params[:product_id], current_cart.id).first
  		@product = Product.where("id = ?", params[:product_id]).first
	    if line_item == nil
	    	item = LineItem.create!(:cart_id => current_cart.id, :product_id => @product.id, :quantity => 1)
	      current_cart.line_items << item
	      current_cart.save
	    else
	      line_item.quantity += 1
	      line_item.save
		  end
      flash[:success] = "Item has successfully added to Cart"
      redirect_to category_path(@product.category_id)
    else
    	flash[:danger] = "Login before adding item to cart"
    	redirect_to new_user_session_path
    end
    current_cart.save
  end

	def show
    if user_signed_in?
    	@cart = current_cart    	
    else
    	redirect_to new_user_session_path
	  end
  end

  def destroy
  	session[:cart_id] = nil
  	redirect_to cart_path
  end

end
