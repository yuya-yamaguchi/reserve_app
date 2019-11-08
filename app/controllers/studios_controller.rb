class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])

    # 本日から1週間分の日付を算出
    today = Date.today
    @week = ["時間/日付"]
    7.times { |i| @week << today + i.day}
    
    # 時間の最大値を取得
    max_hour = Reserve.where(studio_id: params[:id]).maximum(:hour)
    # 時間の最小値を取得
    min_hour = Reserve.where(studio_id: params[:id]).minimum(:hour)
    # インクリメント用変数
    hour = min_hour
    
    @studio_reserves = []
    while max_hour >= hour do
      # 各日の時間単位で配列に設定
      @studio_reserves.push(Reserve.where(studio_id: params[:id]).where(hour: hour).where('date between ? and ?', @week[1], @week[7]).order(:date))
      hour += 1
    end
  end

end
