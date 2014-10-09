class User < ActiveRecord::Base
  has_many :workout_sessions
  has_many :workouts, through: :workout_sessions

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
