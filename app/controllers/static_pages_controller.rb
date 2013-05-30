class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def index
   @product = Product.find(params[:id])
  end

  def cart
    # return render text: params[:id]
   #@product = Product.find(params[:id])
   #@product.to_i = 0
   if params[:id].nil?
      flash[:success] = "Your don't have any item in cart"
   else
     @product = Product.find(params[:id])
   end

  end

end
