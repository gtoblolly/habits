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

    private

    def record_params
      params.require(:record).permit(:text, :habit_id)
    end
    
end
