class ProductsController < ApplicationController
  before_action :find_product, except: [:index, :new, :create]

  def index
    @products = Product.all
    @categories = Category.all
  end

  def new
    @product = current_user.products.build
    @categories = Category.all
  end

  def create
    @product = current_user.products.build product_params
    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def show
  end

  def edit
    @categories = Category.all
  end

  def update
    if @product.update product_params
      redirect_to products_url
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private
  def product_params
    params.require(:product).permit :id, :title, :price, :description,
      :avg_rating, :category_id, :product_image, :user_id
  end

  def find_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:error] = t("product_not_found")
      redirect_to root_url
    end
  end
end
