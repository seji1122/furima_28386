class Item < ApplicationRecord
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :image
      t.string :introduction
      t.integer :category
      t.integer :item_condition
      t.integer :delivery_fee
      t.integer :shipping_area
      t.integer :shipping_days
      t.reference :user 
      t.timestamps
    end
  end


end
