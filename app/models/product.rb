class Product < ActiveRecord::Base
  attr_accessible :categoryid, :date, :desc, :id, :img, :price,:title
end
