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
    @bookings = Booking.all
    @review = Review.new
  end

  def create
    if user_signed_in?
      @meeseek = Meeseek.find(params[:meeseek_id])
      @booking = Booking.new(booking_params)
      @booking.meeseek = @meeseek
      @booking.user = current_user
      if @booking.save
        redirect_to my_bookings_meeseeks_path, success: "Congrats, your booking has been confirmed"
      else
        redirect_to my_bookings_meeseeks_path, danger: @booking.errors[:task].join(" & ")
      end
    else
      redirect_to new_user_session_path, danger: "You need to be logged in"
    end
  end

  def edit
    @meeseek = Meeseek.find(params[:meeseek_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @meeseek = Meeseek.find(params[:meeseek_id])
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @booking.meeseek = @meeseek
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_meeseeks_path, success: "Congrats, your booking has been changed"
    else
      redirect_to meeseek_path(:id), danger: @booking.errors[:task].join(" & ")
    end
  end

  def my_reviews
    @my_reviews = Review.where(booking_id: params[:id])
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:task, :meeseek_id, :date_available_from, :date_available_to, :user_id)
  end

end
