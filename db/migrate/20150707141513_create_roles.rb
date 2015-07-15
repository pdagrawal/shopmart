class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_foreign_key :roles, :users
  end
end
