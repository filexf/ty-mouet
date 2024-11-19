class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @mouette = Mouette.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.renter = current_user
    @booking.mouette = @mouette
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :mouette_id)
  end
end
