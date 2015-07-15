class ProductsController < ApplicationController
  
  def show
    if Product.find(params[:id]).blank?
      flash[:danger] = "This Product is not available"
      redirect_to root_path
    else
      @product = Product.find(params[:id])
    end
  end

end
