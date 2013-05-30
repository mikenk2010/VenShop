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
    @product = @search.results
    @count = @product.count
    if @count == 0
      flash[:success] = "Not found any products"
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

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Delete item"
    redirect_to products_url
  end



  def addtocart
   flash[:success] = "Success add to cart"
  end

  private
   def product_params
     params.require(:product).permit(:categoryid, :date, :desc, :id, :img, :price)
   end

end

