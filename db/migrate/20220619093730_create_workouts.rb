class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.text :memo
      t.integer :sleep
      t.integer :eat
      t.integer :motivation
      t.integer :fatigue
      t.integer :mental
      t.datetime :start_time
      t.integer :workout_menus

      t.timestamps
    end
  end
end
