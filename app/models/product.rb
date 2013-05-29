class Product < ActiveRecord::Base
  attr_accessible :categoryid, :date, :desc, :id, :img, :price,:title

  searchable do
    text  :title, :boost => 5
    text :desc
    text :id
    text :comments do
      comments.map { |comment| comment.body }
    end
  end
end
