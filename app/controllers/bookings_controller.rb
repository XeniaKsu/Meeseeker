class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  # def new
  #   # @meeseek = Meeseek.find(params[:meeseek_id])
  #   # @booking = Booking.new
  # end

  def show
    @selected_meeseek = Meeseek.find(params[:meeseek_id])
    @booking = Booking.new
    @selected_booking = Booking.find(params[:id])
    @meeseek = Meeseek.new
  end

  def create
    @meeseek = Meeseek.find(params[:meeseek_id])
    @booking = Booking.new(booking_params)
    @booking.meeseek = @meeseek
    @booking.user = current_user
    if @booking.save
      # find a path to redirect a user to
      redirect_to my_bookings_meeseeks_path
    # else
    #   render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params

    params.require(:booking).permit(:task, :meeseek_id, :date_available_from, :data_available_to, :user_id)

  end

end
