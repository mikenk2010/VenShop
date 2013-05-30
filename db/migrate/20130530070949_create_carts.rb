class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :id
      t.integer :idcart
      t.integer :userid
      t.integer :idproduct
      t.integer :quantity

      t.timestamps
    end
  end
end
