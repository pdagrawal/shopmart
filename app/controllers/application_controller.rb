class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:full_name, :email, :password, :password_confirmation, :address)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:full_name, :email, :password, :password_confirmation, :current_password, :mobile_no, :address, :pincode, :state) }
  end  
  
  protect_from_forgery with: :exception

  def current_cart
    if user_signed_in?
      if session[:cart_id].blank?
        @current_cart = Cart.create(user_id: current_user.id)
        session[:cart_id] = @current_cart.id
      else
        @current_cart = Cart.find(session[:cart_id])
      end
      @current_cart
    end
  end

  def is_admin
    Role.where(user_id: current_user.id).all.each do |role|
      if role.role_name == "Admin"
        @admin_flage = "Y"
      else
        @admin_flage = "N"
      end
    end
    unless @admin_flage == "Y"
      flash[:danger] = "You must have admin authorities to access this section"
      redirect_to root_path
    end
  end

end
