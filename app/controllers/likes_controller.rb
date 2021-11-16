class LikesController < ApplicationController

  def create
    @habits = Habit.all
    @record = Record.find(params[:record_id])
    Like.create(user_id: current_user.id, record_id: params[:record_id])
  end

  def destroy
    @habits = Habit.all
    @record = Record.find(params[:record_id])
    Like.find_by(user_id: current_user.id, record_id: params[:record_id]).destroy
  end

end
