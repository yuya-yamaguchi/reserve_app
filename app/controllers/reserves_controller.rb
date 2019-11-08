class ReservesController < ApplicationController
  def show
    @studio = Studio.find(params[:studio_id])
    @studio_resrve = Reserve.find(params[:id])
    
    @hairetsu = [10, 11, 12, 13, 14, 15]
    @hairetsu2 = [11, 12, 13, 14, 15, 16]

    today = Date.today
    @week = ["時間/日付"]
    7.times { |i| @week << today + i.day}
  end

  def update
    @reserves = Reserve.where(studio_id: params[:studio_id]).where(date: params[:date]).where('? <= hour and hour < ?', params[:start_hour], params[:end_hour])
    @reserves.update(reserve_flg: 1)
    redirect_to root_path
  end
end


