class WorkoutSessionsController < ApplicationController
  def new
    @workout_session = WorkoutSession.new
    @workout_session.workout.build if @workout_session.workout.nil?
    @workout_session.workout.workout_exercises if @workout_session.workout.workout_exercises.empty?
  end

  def create
    @workout = Workout.new(workout_params)
    @workout_session = WorkoutSession.new(workout_session_params)

    if @workout_session.save
      redirect_to new_workout_session_path, notice: "Success!"
    else
      render :new, notice: "Failure!"
    end
  end
end
