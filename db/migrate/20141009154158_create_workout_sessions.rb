class CreateWorkoutSessions < ActiveRecord::Migration
  def change
    create_table :workout_sessions do |t|
      t.integer :user_id, null: false
      t.integer :workout_id, null: false
      t.datetime :date_completed, null: false
      t.text :notes

      t.timestamps
    end
  end
end
