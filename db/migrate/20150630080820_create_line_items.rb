class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
    	t.integer :quantity
      t.references :cart, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_foreign_key :line_items, :carts
    add_foreign_key :line_items, :orders
    add_foreign_key :line_items, :products
  end
end
