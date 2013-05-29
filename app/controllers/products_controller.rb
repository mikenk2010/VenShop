# encoding: UTF-8
class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])

  end

  def index
    @search = Product.search do
      fulltext params[:search]
    end

    if @product == ''
      flash[:success] = "Not found"
    else

      @product = @search.results
      @count = @product.count

    end
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def addtocart
   flash[:success] = "Success add to cart"
 end

 private
 def product_params
   params.require(:product).permit(:categoryid, :date, :desc, :id, :img, :price)
 end
end

