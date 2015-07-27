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
      @line_item.create_activity :update, owner: current_user
      flash[:success] = "Cart has successfully Updated"
      redirect_to cart_path
    else
      flash[:danger] = "There is some error in edit process"
      render 'edit'
    end
  end

  def destroy
    @line_item.create_activity :destroy, owner: current_user
    redirect_to cart_path if @line_item.destroy
    flash[:success] = "Item is successfully removed"
  end

  private
  def line_item_params
    params.require(:line_item).permit(:quantity)
  end

  def require_line_item
    @line_item = current_cart.line_items.find(params[:id])
  end
end
