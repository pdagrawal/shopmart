class CategoriesController < ApplicationController
	before_action :require_category, only: [:show, :destroy]
	before_action :require_admin_login, except: [:index, :show]
	
	def index
		@categories = Category.all
	end

	def show
		@current_cart = current_cart
	end

	def new
		@category = Category.new
		@categories = Category.all
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category has successfully added"
			redirect_to new_category_path
		else
			flash[:danger] = "Enter a valid Category"
			redirect_to new_category_path
		end
	end

	def destroy
	  @category.destroy
	  flash[:success] = "Category is removed"
	  redirect_to new_category_path
	end

	private
  def category_params
    params.require(:category).permit(:category)
  end

  def require_admin_login
    unless session[:admin]
      flash[:danger] = "You must have admin authorities to access this section"
      redirect_to admin_index_path
    end
  end

  def require_category
    if Category.where(id: params[:id]).first.blank?
			flash[:danger] = "This category is not available"
			redirect_to root_path
		else
			@category = Category.where(id: params[:id]).first
		end
  end
end
