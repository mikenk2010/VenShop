class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
     redirect_to @product
    else
      render 'new'
    end
  end

  private
  def product_params
     params.require(:product).permit(:categoryid, :date, :desc, :id, :img, :price)
  end
end
