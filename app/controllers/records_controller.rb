class RecordsController < ApplicationController

  def new
    @record = Record.new
  end

  def create
    @record = Record.create(record_params)
    if @record.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @habit = Habit.all
    @record = Record.find(params[:id])
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy
    redirect_to root_path
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
    
end
