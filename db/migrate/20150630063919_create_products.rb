class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :products, :categories
  end
end
