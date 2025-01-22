class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      # メール送信
      ReservationMailer.confirmation_email(@reservation).deliver_later

      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def index
  end

  private
  def reservation_params
    params.require(:reservation).permit(:full_name, :email, :date, :time, :number_of_people)
  end

end
