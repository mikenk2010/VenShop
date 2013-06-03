# encoding: UTF-8
class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])

  end

  def edit
    @product = Product.find(params[:id])
  end

  def edit

    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find (params[:id])
    if @product.update_attributes(params[:product])
     flash[:success] = "Product updated"
     redirect_to @product
   else

   end



 end

 def index
  if @count == 0
    flash[:success] = "Not found any products"
  end
    @products = Product.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    @count = @products.size
end

def editproduct
  @product = Product.find(params[:id])
end

def create
  @product = Product.new(params[:product])
  if @product.save
    flash[:success] = "Success import date"
    redirect_to @product
  else
    flash[:success] = "Fail import date to SQLite"
    render 'new'
  end
end

def destroy
  Product.find(params[:id]).destroy
  flash[:success] = "Delete item"
  redirect_to products_url
end

 def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @cart.add_product(product)
    redirect_to(:action => 'display_cart')
  end

  def display_cart
    @cart = find_cart
    @items = @cart.items
  end

private
def product_params
 params.require(:product).permit(:categoryid, :date, :desc, :id, :img, :price)
end

end

