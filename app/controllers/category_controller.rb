require 'open-uri'
require 'json'
class CategoryController < ApplicationController
  def new
  end

  def index
    #@category = Category.paginate(:page => params[:page], :per_page => 10)
    @count = Product.count
    @category = Category.find :all
    # @products = Product.search(params[:search]).paginate(:page => params[:page], :per_page => 10)

    # @url = []
    # content = open("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch?appid=dj0zaiZpPXpIMzBsMUQyTk55dSZkPVlXazlZWGxzYjNoWU0yVW1jR285TUEtLSZzPWNvbnN1bWVyc2VjcmV0Jng9MzI-&category_id=635&sort=-sold").read
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
    #   Category.create(id: cate_ids, name: name)
    #   flash[:success] = "Success import date"
    # end
  end

  def show
    @category = Category.find(params[:id])
    @cateshow = Product.find_all_by_categoryid(params[:id])
    @catecount = Product.find_all_by_categoryid(params[:id]).count
    @posts = Product.where(:categoryid => params[:id]).paginate(:page => params[:page], :per_page => 10)

  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Delete item"
    redirect_to category_url
  end
end





