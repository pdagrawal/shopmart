class WelcomeController < ApplicationController
  def index
    @products = Product.all
    @current_cart = current_cart
  end

  def about_us
  end

  def contact_us
  end
end
