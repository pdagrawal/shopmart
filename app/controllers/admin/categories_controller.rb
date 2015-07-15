class Admin::CategoriesController < ApplicationController
  before_action :require_admin_login
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category has successfully added"
      redirect_to new_admin_category_path
    else
      flash[:danger] = "Enter a valid Category"
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Category is removed"
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:category_name)
  end

  def require_admin_login
    if user_signed_in?
      is_admin
    else
      redirect_to new_user_session_path
    end
  end

end
