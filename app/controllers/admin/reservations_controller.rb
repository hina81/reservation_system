class Admin::ReservationsController < ApplicationController
  before_action :authenticate_admin!  # 管理者認証

  # 予約一覧画面
  # def index
  #   @reservations = Reservation.all
  # end
  def index
    @confirmed_reservations = Reservation.where(status: '確定').order(date: :asc, time: :asc)
    @unconfirmed_reservations = Reservation.where(status: '未確定').order(date: :asc, time: :asc)
  end

  # 予約詳細画面
  def show
    @reservation = Reservation.find(params[:id])
  end

  # 予約編集画面
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # 予約情報更新
  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to admin_reservation_path(@reservation), notice: '予約情報が更新されました。'
    else
      render :edit
    end
  end

  # 予約削除
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to admin_reservations_path, notice: '予約が削除されました。'
  end

  # 予約状態
  def toggle_status
    @reservation = Reservation.find(params[:id])
    if @reservation.status == '確定'
      @reservation.update(status: '未確定')
    else
      @reservation.update(status: '確定')
    end
    redirect_to admin_reservation_path(@reservation), notice: '予約状態を更新しました。'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :phone, :date, :time, :number_of_people, :message, :status)
  end
end
