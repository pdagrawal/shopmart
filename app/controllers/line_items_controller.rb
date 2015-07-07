class LineItemsController < ApplicationController
	before_action :require_line_item, only: [:edit, :update, :destroy]
	def index
		@line_items = LineItem.all
	end

	def new
		@line_item = LineItem.new
	end

  def edit
  end

  def update
		if @line_item.update(line_item_params)
			flash[:success] = "Cart has successfully Updated"
			redirect_to cart_path
		else
			flash[:danger] = "There is some error in edit process"
			render 'edit'
		end
  end

  def destroy
	  @line_item.destroy
	  flash[:success] = "Item is successfully removed"
	  redirect_to cart_path
  end

	private
  def line_item_params
    params.require(:line_item).permit(:quantity)
  end

  def require_line_item
    @line_item = current_cart.line_items.where(id: params[:id]).first
  end
end
