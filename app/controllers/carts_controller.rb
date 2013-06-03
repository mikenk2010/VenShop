class CartsController < ApplicationController
  def new
  end

  def add
  end

  def index
  end
  def create
    if params[:id].nil?
      flash[:success] = "Your don't have any item in cart"
    else
      @product = Product.find(params[:id])
      flash[:success] = "Add success to cart"
    end
  end

  def add_to_cart
    @product = Product.find(param[:id])
    @cart = find_cart
    @cart.add_product
  end
end
