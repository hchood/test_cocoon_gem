class WorkoutSessionsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @workout_session = WorkoutSession.new
    @workout_session.workout = Workout.new
    # @workout_session.workout.build if @workout_session.workout.nil?
    @workout_session.workout.workout_exercises.build if @workout_session.workout.workout_exercises.empty?
    WorkoutExercise.new(workout: @workout_session.workout)
  end

  def create
    @workout = Workout.new(workout_params)
    @workout_session = WorkoutSession.new(workout_session_params)
binding.pry
    if @workout_session.save
      redirect_to new_workout_session_path, notice: "Success!"
    else
      render :new, notice: "Failure!"
    end
  end

  private

  def workout_session_params
    params.require(:workout_session).permit(:'date_completed(1i)', :'date_completed(2i)', :'date_completed(3i)' ).merge(user: User.find(params[:user_id]))
  end

  def workout_params
    params.require(:workout_session).require(:workout_attributes).require(:workout).permit(:name)
  end
end
