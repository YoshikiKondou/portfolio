class CreateDiets < ActiveRecord::Migration[7.0]
  def change
    create_table :diets do |t|
      t.float :body_weight
      t.float :protein
      t.float :fat
      t.float :carbohydrate
      t.datetime :record_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
