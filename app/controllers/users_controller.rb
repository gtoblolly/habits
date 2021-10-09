class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @habits = user.habits.order("created_at DESC")
    @records = user.records.order("created_at DESC")
  end

end