class ProductsController < ApplicationController
  before_action :find_product, except: [:index, :new, :create]

  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
  end

  def edit
    @categories = Category.all
  end

  def new
    @product = current_user.products.build
    @categories = Category.all
  end

  def create
    @product = current_user.products.build product_params

    respond_to do |format|
      if @product.save
        category = Category.find_by id: params[:product][:category_id]
        category.products << @product

        format.html{redirect_to products_url}
      else
        format.html{render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update product_params
        format.html{redirect_to products_url}
      else
        format.html{render :edit}
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html{redirect_to products_url}
    end
  end

  private
  def product_params
    params.require(:product).permit :id, :title, :price, :description,
      :avg_rating, :category_id, :product_image, :user_id
  end

  def find_product
    @product = Product.find_by id: params[:id]
  end
end
