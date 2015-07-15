class CategoriesController < ApplicationController
  def show
    if Category.find(params[:id]).blank?
      flash[:danger] = "This category is not available"
      redirect_to root_path
    else
      @category = Category.find(params[:id])
    end
    @current_cart = current_cart
  end

end
