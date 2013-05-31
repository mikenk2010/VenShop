class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
    @category = Category.all

    # @url = []
    # content = open("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch?appid=dj0zaiZpPXpIMzBsMUQyTk55dSZkPVlXazlZWGxzYjNoWU0yVW1jR285TUEtLSZzPWNvbnN1bWVyc2VjcmV0Jng9MzI-&category_id=110&sort=-sold").read
    # result = JSON.parse(content)
    # #@url = parsed_data["ResultSet"]["totalResultsAvailable"]
    # total = result["ResultSet"]["totalResultsReturned"].to_i - 1
    # cates =  []
    # for i in 0..total
    #   category = result["ResultSet"]["0"]["Result"]["#{i}"]
    #   @url << category

    #   cate_id = category['Category']['Current']['Id']
    #   cate_name = category['Category']['Current']['Name']
    #   cates << [cate_id, cate_name]

    #   cates.uniq.each do |item|
    #     Category.create(id: item[0], name: item[1])
    #     flash[:success] = "Success import date"
    #   end
    #   Category.create(id: cate_id, name: name)
    #   flash[:success] = "Success import date"
    # end
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
