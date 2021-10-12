class HabitsController < ApplicationController

  def index
    @habits = Habit.all
    @records = Record.all.order("created_at DESC")
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

  def destroy
    habit = Habit.find(params[:id])
    habit.destroy
    redirect_to root_path
  end

  def edit
    @habit = Habit.find(params[:id])
  end

  def update
    habit = Habit.find(params[:id])
    habit.update(habit_params)
    redirect_to root_path
  end

  def show
    @habit = Habit.find(params[:id])
  end

  private

  def habit_params
    params.require(:habit).permit(:title, :content).merge(user_id: current_user.id)
  end

end
