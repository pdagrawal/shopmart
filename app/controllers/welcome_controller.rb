class WelcomeController < ApplicationController
  def index
    @categories = Category.all.reject { |c| c.products.blank? }
  end

  def about_us
  end

  def contact_us
  end
end
