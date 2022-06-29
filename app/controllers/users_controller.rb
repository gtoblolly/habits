class UsersController < ApplicationController



  def show
    gon.user = User.find(params[:id])
    @nickname = gon.user.nickname
    @habits = gon.user.habits.order("created_at DESC")
    @records = gon.user.records.order("created_at DESC").page(params[:page])
  end

end