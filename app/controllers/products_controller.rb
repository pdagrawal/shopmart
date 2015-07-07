class ProductsController < ApplicationController
	before_action :require_admin_login, except: [:show]
	def index
		@products = Product.all
		@categories = Category.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
		@categories = Category.all
	end

	def create
		@category = Category.find(params[:product][:category])
		@product = @category.products.create(product_params)
		if @product.save
			flash[:success] = "Product has successfully added"
			redirect_to new_product_path
		else
			flash[:danger] = "Fields can't be empty."
			@categories = Category.all
			render 'new'
		end
	end

	def edit
		@categories = Category.all
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			flash[:success] = "Product has successfully Updated"
			redirect_to products_path
		else
			flash[:danger] = "There is some error in edit process"
			render 'edit'
		end
	end

	def destroy
	  @product = Product.find(params[:id])
	  @product.destroy
	  flash[:success] = "Product is successfully removed"
	  redirect_to products_path
	end

	private
  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

  def require_admin_login
    unless session[:admin]
      flash[:danger] = "You must have admin authorities to access this section"
      redirect_to admin_index_path
    end
  end
end
