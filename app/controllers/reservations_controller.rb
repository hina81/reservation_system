class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.status = '未確定'
    
    # 保存後に予約情報をセッションに保存
    if @reservation.save
      session[:reservation_id] = @reservation.id  # 予約IDをセッションに保存
      redirect_to reservation_complete_path
    else
      render :new
    end
  end

  def complete
    # セッションから予約情報を取得
    @reservation = Reservation.find(session[:reservation_id]) if session[:reservation_id]
    
    # 予約情報がない場合、リダイレクト
    if @reservation.nil?
      redirect_to root_path, notice: "予約情報が見つかりません"
    else
      session.delete(:reservation_id)  # 予約情報をセッションから削除
    end
  end

  def index
  end

  private
  def reservation_params
    params.require(:reservation).permit(:last_name, :kana_last_name, :first_name, :kana_first_name, :email, :date, :time, :number_of_people)
  end

end
