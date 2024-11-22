class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @mouette = @booking.mouette
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

  def reject
    @booking = Booking.find(params[:id])
    @booking.rejected!
    # raise
    redirect_to owner_bookings_path(current_user), notice: "Réservation rejected avec succès."
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted!
    # raise
    redirect_to owner_bookings_path(current_user), notice: "Réservation accepted avec succès."
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
