class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :users
  end
end
