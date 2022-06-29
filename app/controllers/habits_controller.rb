class HabitsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @habits = Habit.all
    @records = Record.all
    @page_records = Record.all.order("created_at DESC").page(params[:page]).per(4)
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.create(habit_params)
    if @habit.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    habit = Habit.find(params[:id])
    habit.destroy
    redirect_to user_path(current_user.id)
  end

  def edit
    @habit = Habit.find(params[:id])
  end

  def update
    habit = Habit.find(params[:id])
    habit.update(habit_params)
    redirect_to habit_path(habit.id)
  end

  def show
    @habits = Habit.all
    @habit = gon.habit = Habit.find(params[:id])
    @records = @habit.records.order("created_at DESC").page(params[:page]).per(2)
  end

  private

  def habit_params
    params.require(:habit).permit(:title, :content).merge(user_id: current_user.id)
  end

  def move_to_index
    @habit = Habit.find(params[:id])
    unless current_user.id == @habit.user.id
      redirect_to root_path
    end
  end

end