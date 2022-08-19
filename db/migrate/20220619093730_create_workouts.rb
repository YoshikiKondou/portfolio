class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.string :part
      t.text :memo
      t.integer :sleep
      t.integer :eat
      t.integer :motivation
      t.integer :fatigue
      t.integer :muscle
      t.datetime :start_time

      t.timestamps
    end
  end
end
