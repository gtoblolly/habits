class HabitsController < ApplicationController

  def index
    @habits = Habit.all
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.create(habit_params)
    if @habit.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def habit_params
    params.require(:habit).permit(:habit, :content)
  end

end
