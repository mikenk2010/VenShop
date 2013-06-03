class LineItemsController < ApplicationController

  def index
    @line_items = LineItem.all
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  def new
    @line_item = LineItem.new
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def create
    @cart = current_cart
    @product = Product.find(params[:id])
    @line_item = @cart.line_items.build(product: product)
    respond_to do |format|
      if @line_item.save
       redirect_to @line_item.cart

      else
      render action: "new"

      end
    end
  end

  def update
      @line_item = LineItem.find(params[:id])
  end

  def destroy
      @line_item = LineItem.find(params[:id])
      @line_item.destroy
  end
end
