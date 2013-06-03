class Product < ActiveRecord::Base
  attr_accessible :categoryid, :date, :desc, :id, :img, :price,:title
  has_many :line_items

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
      where('desc LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
