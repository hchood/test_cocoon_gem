class Workout < ActiveRecord::Base
  has_many :workout_sessions
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  accepts_nested_attributes_for :workout_exercises,
    reject_if: :all_blank,
    allow_destroy: true

  validates :name, presence: true
end
