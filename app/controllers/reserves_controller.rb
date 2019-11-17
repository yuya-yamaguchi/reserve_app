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
    @week = []
    7.times { |i| @week << today + i.day}
  end

  def update
    studio = Studio.find(params[:studio_id])
    @reserves = Reserve.where(studio_id: params[:studio_id])
                       .where(date: params[:date])
                       .where('? <= hour and hour < ?', params[:start_hour], params[:end_hour])
    @reserves.update(reserve_flg: 1)

    use_time = params[:end_hour].to_i - params[:start_hour].to_i
    payment_fee = studio.fee * use_time

    reserve_detail = ReserveDetail.new(user_id: current_user.id,
                                       studio_id: params[:studio_id],
                                       reserve_date: params[:date],
                                       start_time: params[:start_hour],
                                       end_time: params[:end_hour],
                                       payment_fee: payment_fee)
    if reserve_detail.save
      redirect_to reserve_user_path(current_user)
    end
  end

  def cancel
    reserve_detail = ReserveDetail.find(params[:id])
    reserve_detail.destroy
    reserve = Reserve.where(studio_id: reserve_detail.studio_id)
                     .where(date:      reserve_detail.reserve_date)
                     .where('? <= hour and hour < ?', reserve_detail.start_time, reserve_detail.end_time)
    if reserve.update(reserve_flg: 0)
      redirect_to reserve_user_path(current_user)
    end
  end
end
