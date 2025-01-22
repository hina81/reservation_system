class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @unconfirmed_reservations_count = Reservation.where(status: '未確定').count
  end
end
