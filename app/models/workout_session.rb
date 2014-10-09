class WorkoutSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout
  accepts_nested_attributes_for :workout

  validates :user, :workout, :date_completed, presence: true
end
