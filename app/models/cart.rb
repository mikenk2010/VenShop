class Cart < ActiveRecord::Base
  attr_accessible :id, :idcart, :idproduct, :quantity, :userid
end
