class WorkoutSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout

  validates :user, :workout, :date_completed, presence: true
end
