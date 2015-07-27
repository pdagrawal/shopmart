class Admin::CategoriesController < Admin::BaseController
  before_action :is_admin?
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
    redirect_to admin_categories_path if Category.find(params[:id]).destroy
    flash[:success] = "Category is removed"
  end

  private
  def category_params
    params.require(:category).permit(:category_name)
  end

end
