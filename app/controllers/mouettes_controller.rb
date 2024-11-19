class MouettesController < ApplicationController
  before_action :set_mouette, only: [:show]

  def index
    @mouettes = Mouette.all
  end

  def show
    @booking = Booking.new
  end

  def mine
    # @mouettes = Mouette.all
    # Mouette.owner_id = @owner_id
    # @mouette = @mouettes.find(params[@owner_id])
  end

  def new
    @mouette = Mouette.new
  end

  def create
    @mouette = Mouette.new(mouette_params)
    if @mouette.save
      redirect_to mouette_path(@mouette)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_mouette
    @mouette = Mouette.find(params[:id])
  end

  def mouette_params
    params.require(:mouette).permit(:name, :availability, :rating, :latitude, :longitude, :accessories, :description, :price)
  end
end
