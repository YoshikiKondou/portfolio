class CreateWorkoutMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_menus do |t|
      t.references :workout, null: false, foreign_key: true
      t.string :menu
      t.float :first_set_weight
      t.float :second_set_weight
      t.float :third_set_weight
      t.float :fourth_set_weight
      t.float :fifth_set_weight
      t.integer :first_set_rep
      t.integer :second_set_rep
      t.integer :third_set_rep
      t.integer :fourth_set_rep
      t.integer :fifth_set_rep

      t.timestamps
    end
  end
end
