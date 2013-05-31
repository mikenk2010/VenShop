class CheckoutsController < ApplicationController
  def new
  end

  def index
    flash[:notice] = "Thank you."
  end

  def hienthi
    @checkout_user = current_user
    @pro = Product.find(params[:id])
    @category = Category.find(@pro.categoryid)
    if current_user.blank?
      redirect_to signin_url, notice: "Please sign in before buy product." unless signed_in?
    end
  end

  def create
    @checkout_user = current_user
    @pro = Product.find(params[:id])
    @category = Category.find(@pro.categoryid)
     @cart = Cart.new(idcart: @category.id,
       userid: @checkout_user.id, idproduct: @pro.id)
     if @cart.save
      UserMailer.checkout_email(@pro,@checkout_user).deliver
       flash[:notice] = "Thank you."
     end
  end



  def update
  end

  def show
    flash[:success] = "Success shopping - See you again"
  end
end
