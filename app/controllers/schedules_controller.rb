class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_at, :end_at, :all_day, :memo))
    
    if @schedule.save
      flash[:notice] ="新しいスケジュールが登録されました"
      redirect_to :schedules
    else
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_at, :end_at, :all_day, :memo))
      flash[:notice] = "スケジュールが更新されました"
      redirect_to :schedules
    else
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules
  end
  
end
