class ProductsController < ApplicationController
  
  def show
    unless Product.find(params[:id]).blank?
      @product = Product.find(params[:id])
    else
      flash[:danger] = "This Product is not available"
      redirect_to root_path
    end
  end

end
