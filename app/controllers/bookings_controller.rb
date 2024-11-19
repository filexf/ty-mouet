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
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      # doit rendre le formulaire à nouveau mais complété
      # donc la show de mouette : comment faire ?
      render :new, status: :unprocessable_entity
    end
  end

  def owner_bookings
    @bookings = Booking.where(mouette: {owner: current_user})
  end

  def renter_bookings
    @bookings = Booking.where(renter: current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
