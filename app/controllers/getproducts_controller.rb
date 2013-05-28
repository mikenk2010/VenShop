require 'open-uri'
require 'json'
class GetproductsController < ApplicationController
  def index
    string = '{"desc":{"someKey":"aaaaaaaaaaaaa","anotherKey":"value"},"main_item":{"stats":{"a":8,"b":12,"c":10}}}'
    parsed = JSON.parse(string) # returns a hash
   #@parsed #= parsed["desc"]["someKey"]


    # # p parsed["main_item"]["stats"]["a"]
    # parsed["someKey"].each do |d|
    #   @url = d
    # end
    @url = []
    content = open("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch?appid=dj0zaiZpPXpIMzBsMUQyTk55dSZkPVlXazlZWGxzYjNoWU0yVW1jR285TUEtLSZzPWNvbnN1bWVyc2VjcmV0Jng9MzI-&category_id=635&sort=-sold").read
    result = JSON.parse(content)
    #@url = parsed_data["ResultSet"]["totalResultsAvailable"]
    total = result["ResultSet"]["totalResultsReturned"].to_i - 1

    for i in 0..total
      product = result["ResultSet"]["0"]["Result"]["#{i}"]
      @url << product

      title = product['Name']
      desc = product['Description']
      img = product['Image']['Medium']
      price= product['Price']['_value']
      categoryid = product['Category']['Current']['Id']
      date = product['Availability']


     # Add to SQL lite
      # if Product.create(price: price, date: date, desc: desc, img: img, categoryid: categoryid, title: title)
      #   flash[:success] = "Success import date"
      # else
      #   flash[:success] = "Fail import date to SQLite"
      # end
    end
  end

end
