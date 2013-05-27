class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :id
      t.string :price
      t.string :date
      t.string :desc
      t.string :img
      t.integer :categoryid

      t.timestamps
    end
  end
end
