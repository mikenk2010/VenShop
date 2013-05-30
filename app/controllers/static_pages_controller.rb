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

  def checkout
        flash[:success] = "Success checkout !!!"

  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Delete item"
    redirect_to root_path
  end



  private
   def product_params
     params.require(:product).permit(:categoryid, :date, :desc, :id, :img, :price)
   end


end
