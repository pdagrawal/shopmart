class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :total
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :carts, :users
  end
end
