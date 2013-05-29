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
   @product = Product.find(params[:id])

  end

end
