class MouettesController < ApplicationController
  before_action :set_mouette, only: [:show]

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @mouettes = Mouette.all
  end

  def show
    @booking = Booking.new
  end

  def mine
    @mouettes = Mouette.all
    Mouette.owner_id = @owner_id
    @mouette = @mouettes.find(params[@owner_id])
  end

  def new
    @mouette = Mouette.new
  end

  def create
    @mouette = Mouette.new(mouette_params)
    @mouette.owner = current_user
    if @mouette.save
      if current_user == @mouette.owner
        flash[:notice] = "Mouette successfully created"
        redirect_to mouette_path(@mouette)
      else
        flash[:alert] = "You are not the owner of this mouette"
        render :new, status: :unprocessable_entity
      end
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
