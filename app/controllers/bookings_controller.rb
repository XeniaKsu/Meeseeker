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
    if current_user
      @meeseek = Meeseek.find(params[:meeseek_id])
      @booking = Booking.new(booking_params)
      @booking.meeseek = @meeseek
      @booking.user = current_user
      @booking.save
      redirect_to my_bookings_meeseeks_path, success: "Congrats, your booking has been confirmed"
    else
      redirect_to new_user_session_path, danger: "You need to be logged in"
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
