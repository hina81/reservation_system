class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    @reservations = Reservation.all
    if @reservation.save
      flash[:notice] = "予約完了しました."
      redirect_to reservation_path(@reservation.id)
    else
      render :index
    end
  end

  def index
  end

  def show
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
