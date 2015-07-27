class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  include PublicActivity::StoreController
  helper_method :current_cart

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:full_name, :email, :password, :password_confirmation, :address)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:full_name, :email, :password, :password_confirmation, :current_password, :mobile_no, :address, :pincode, :state) }
  end  
  
  protect_from_forgery with: :exception

  def current_cart
    return nil unless user_signed_in?
    return Cart.find(session[:cart_id]) unless session[:cart_id].blank?
    cart = Cart.create(user_id: current_user.id, total: "0")
    session[:cart_id] = cart.id
    cart
  end

  def require_user_login
    unless user_signed_in?
      flash[:danger] = "You must be logged in to access this section"
      redirect_to new_user_session_path
    else
      @current_cart = current_cart
    end
  end

end
