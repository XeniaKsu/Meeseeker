class MeeseeksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_meeseek, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @meeseeks = Meeseek.search_by_postcode(params[:query])
    else
      @meeseeks = Meeseek.all
    end
    @markers = @meeseeks.geocoded.map do |meeseek|
      {
        lat: meeseek.latitude,
        lng: meeseek.longitude
      }
  end

  def show
    @booking = Booking.new
  end

  def new
    @meeseek = Meeseek.new
  end

  def edit
  end

  def create
    @meeseek = Meeseek.new(meeseek_params)
    @meeseek.user = current_user
    if @meeseek.save
      redirect_to meeseek_path(@meeseek)
    else
      render :new, status: unprocessable_entity
    end
  end

  def update
    if @meeseek.update(meeseek_params)
      redirect_to @meeseek, notice: "Meeseek was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meeseek.destroy
    redirect_to meeseeks_path, notice: "Meeseek was successfully destroyed"
  end

  def my_bookings
    @my_bookings = Booking.where(user_id: current_user)
  end

  private

  def meeseek_params
    params.require(:meeseek).permit(:postcode)
  end

  def set_meeseek
    @meeseek = Meeseek.find(params[:id])
  end
end
