class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def new
    @record = Record.new
  end

  def create
    ActiveRecord::Base.transaction do
      @record = Record.create(record_params)
      @record.save
      @habit = Habit.find(@record.habit_id)
      @habit.exp_sum += @record.exp.to_i
      @habit.level = @habit.exp_sum.to_i / 5
      @habit.update(exp_sum: @habit.exp_sum, level: @habit.level)
    end
      redirect_to root_path
    rescue => e
      render :new
  end

  def show
    @habit = Habit.all
    @record = Record.find(params[:id])
  end

  def destroy
    ActiveRecord::Base.transaction do
      record = Record.find(params[:id])
      habit = Habit.find(record.habit_id)
      record.destroy
      habit.exp_sum -= 1
      habit.level = habit.exp_sum.to_i / 5
      habit.update(exp_sum: habit.exp_sum, level: habit.level)
    end
      redirect_to root_path
    rescue => e
      render :new
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    @record.update(record_params)
    redirect_to root_path
  end

  private

  def record_params
    params.require(:record).permit(:text, :habit_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @record = Record.find(params[:id])
    unless current_user.id == @record.user.id
      redirect_to root_path
    end
  end
    
end