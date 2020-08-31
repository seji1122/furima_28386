class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :post_coad, null: false
      t.string :city, null: false
      t.string :banchi, null: false
      t.string :building_num
      t.string :phone_num, null: false
      
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
