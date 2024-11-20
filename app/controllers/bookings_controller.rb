class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @mouette = Mouette.find(params[:mouette_id])
    @booking = Booking.new(booking_params)
    @booking.renter = current_user
    # à mettre à jour une fois Devise terminé
    @booking.mouette = @mouette

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "mouettes/show", status: :unprocessable_entity
    end
  end

  def owner_bookings
    @bookings = current_user.bookings_as_owner
  end

  def renter_bookings
    @bookings = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
