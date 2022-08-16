class ReviewsController < ApplicationController

  # def new
  #   @review = Review.new
  # end

  def create
    if user_signed_in?
      booking = Booking.find(params[:booking_id])
      meeseek = Meeseek.find(params[:meeseek_id])
      review = Review.new(review_params)
      review.booking = booking
      if review.save
        redirect_to meeseek_booking_reviews_path(meeseek, booking), success: "Thank you for your review"
      else
        redirect_to meeseek_booking_reviews_path(meeseek, booking), status: :unprocessable_entity, danger: "You have already reviewed"
      end
    else
      redirect_to new_user_session_path, danger: "You need to be logged in"
    end
  end



  private
  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
