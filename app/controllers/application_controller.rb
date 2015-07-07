class ApplicationController < ActionController::Base
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_cart
  	unless user_signed_in?
  		@current_cart = Cart.new
  	else
			if session[:cart_id].blank?
		    @current_cart = Cart.create(user_id: current_user.id)
		    session[:cart_id] = @current_cart.id
		  else
		    @current_cart = Cart.where(id: session[:cart_id]).first
		  end
		end
	  @current_cart
  end
end
