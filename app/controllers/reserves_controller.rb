class ReservesController < ApplicationController
  
  def index
    @studios = Studio.all
    
    @reserves = []
    @studios.each do |studio|
      @reserves << Reserve.where(studio_id: studio.id)
    end
  end
  
  def show
    @studio = Studio.find(params[:studio_id])
    @studio_resrve = Reserve.find(params[:id])
    
    @hairetsu = [*10..21]
    @hairetsu2 = [*11..22]

    today = Date.today
    @week = ["時間/日付"]
    7.times { |i| @week << today + i.day}
  end

  def update
    @reserves = Reserve.where(studio_id: params[:studio_id])
                       .where(date: params[:date])
                       .where('? <= hour and hour < ?', params[:start_hour], params[:end_hour])
    @reserves.update(reserve_flg: 1)

    reserve_detail = ReserveDetail.new(user_id: current_user.id,
                                       studio_id: params[:studio_id],
                                       reserve_date: params[:date],
                                       start_time: params[:start_hour],
                                       end_time: params[:end_hour])
    reserve_detail.save
    redirect_to root_path
  end
end
