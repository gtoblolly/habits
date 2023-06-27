class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def new
    @record = Record.new
  end

  def create
    @record = Record.create(record_params)
    habit = Habit.find(@record.habit_id)
    Record.save(@record, habit)
    redirect_to user_path(current_user.id)
  end

  def show
    @habits = Habit.all
    @record = Record.find(params[:id])
    @habit = Habit.find(@record.habit_id)
  end

  def destroy
    record = Record.find(params[:id])
    habit = Habit.find(record.habit_id)
    Record.destroy(record, habit)
    redirect_to user_path(current_user.id)
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record.update(record_params)
    @habit = Habit.find(@record.habit_id)
    redirect_to habit_record_path(@habit.id, @record.id)
  end

  def date
    @date = Date.parse(params[:date])
    if params[:user_id]
      @user = User.find(params[:user_id])
      @habits = @user.habits
      @records = @user.records.where(created_at: @date.beginning_of_day..@date.end_of_day)
    else params[:habit_id]
      @habit = Habit.find(params[:habit_id])
      @habits = Habit.all
      @records = @habit.records.where(created_at: @date.beginning_of_day..@date.end_of_day)
    end
  end

  private

  def record_params
    params.require(:record).permit(:text, :habit_id, :image, :exp).merge(user_id: current_user.id)
  end

  def move_to_index
    @record = Record.find(params[:id])
    unless current_user.id == @record.user.id
      redirect_to root_path
    end
  end

end