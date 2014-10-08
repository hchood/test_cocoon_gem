class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
    @workout.workout_exercises.build if @workout.workout_exercises.empty?
  end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      redirect_to new_workout_path, notice: "Success!"
    else
      render :new, notice: "Failure!"
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name)
  end
end
