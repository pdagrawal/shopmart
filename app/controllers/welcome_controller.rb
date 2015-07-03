class WelcomeController < ApplicationController
  def index
  	@products = Product.all
  	@categories = Category.all
  end

  def about_us
  end

  def contact_us
  end
end
