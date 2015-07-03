class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
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
			flash[:danger] = "Category can't be blanck."
			redirect_to new_category_path
		end
	end

	def destroy
	  @category = Category.find(params[:id])
	  @category.destroy
	  flash[:success] = "Category is removed"
	  redirect_to new_category_path
	end

	private
  def category_params
    params.require(:category).permit(:category)
  end
end
