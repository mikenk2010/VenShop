class Cart < ActiveRecord::Base
  attr_accessible :id, :idcart, :idproduct, :quantity, :userid
  has_many :line_items, dependent: :destroy

  def add_product(product)
    @items << LineItem.for_product(product)
    @total_price += product.price
  end

  def total_price
    items.to_a.sum(&:full_price)
  end
end
