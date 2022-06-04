class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    set_product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path(@product), notice: "L'item a bien été créée"
    else
      render :new
    end
  end

  def edit
    set_product
  end

  def update
    set_product
    @product.update(product_params)
    redirect_to product_path(@product), notice: "L'item a bien été mis à jour"
  end

  def destroy
    set_product
    @product.destroy
    redirect_to products_path(@product), notice: "L'item a bien été supprimé"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category, :price, photos: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
