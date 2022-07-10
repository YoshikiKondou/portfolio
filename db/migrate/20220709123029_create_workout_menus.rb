class CreateWorkoutMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_menus do |t|
      t.string :menu
      t.integer :weight
      t.integer :rep
      t.integer :set

      t.timestamps
    end
  end
end
