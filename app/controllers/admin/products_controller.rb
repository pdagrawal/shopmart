class Admin::ProductsController < Admin::BaseController
  before_action :is_admin?
  before_action :require_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def show
    redirect_to product_path
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Category.find(params[:product][:category]).products.new(product_params)
    if @product.save
      @product.create_activity :create, owner: current_user
      flash[:success] = "Product has successfully added"
      redirect_to new_admin_product_path
    else
      flash[:danger] = "Fields can't be empty."
      @categories = Category.all
      render 'new'
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @product.update(product_params)
      @product.create_activity :update, owner: current_user
      flash[:success] = "Product has successfully Updated"
      redirect_to admin_products_path
    else
      flash[:danger] = "There is some problem in edit process"
      render 'edit'
    end
  end

  def destroy
    @product.create_activity :destroy, owner: current_user
    redirect_to admin_products_path if @product.destroy
    flash[:success] = "Product is successfully removed"
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :image)
  end

  def require_product
    @product = Product.find(params[:id])
  end
end
