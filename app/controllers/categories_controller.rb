class CategoriesController < ApplicationController
  def show
    unless Category.find(params[:id]).blank?
      @category = Category.find(params[:id])
    else
      flash[:danger] = "This category is not available"
      redirect_to root_path
    end
    @current_cart = current_cart
  end

end
