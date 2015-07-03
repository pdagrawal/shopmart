class LineItemsController < ApplicationController
	def index
		@line_items = LineItem.all
	end

	def new
		@line_item = LineItem.new
	end

  def edit
  	@line_item = LineItem.find(params[:id])
  end

  def update
  	@line_item = LineItem.find(params[:id])
		if @line_item.update(line_item_params)
			flash[:success] = "Cart has successfully Updated"
			redirect_to cart_path
		else
			flash[:danger] = "There is some error in edit process"
			render 'edit'
		end
  end

  def destroy
  	@line_item = LineItem.find(params[:id])
	  @line_item.destroy
	  flash[:success] = "Item is successfully removed"
	  redirect_to cart_path
  end

	private
  def line_item_params
    params.require(:line_item).permit(:quantity)
  end
end
