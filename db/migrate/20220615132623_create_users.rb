class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :password_digest
      t.string :image
      t.text :introduction
      t.float :target_protein
      t.float :target_fat
      t.float :target_carbohydrate
      t.timestamps
    end
  end
end
