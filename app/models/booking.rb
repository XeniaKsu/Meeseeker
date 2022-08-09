class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :meeseek, dependent: :destroy
  validates_presence_of :meeseek, :task
  validate :no_past_booking
  validate :overlaps
  # Need to add validation around if Meeseeks already booked during that time then not possible to book again.
  #add user to validation


  # Bookings cannot be in the past
  # def no_past_booking
  #   if Date.today > data_available_to || date_available_from
  #     redirect_to meeseek_path danger: "Booking cannot be in the past"
  #   end
  # end

  # Ovelapping booking
  # def overlaps
  #   bookings = Booking.where(meeseek_id: id)
  #   bookings.each do |booking|
  #     if data_available_to < booking.data_available_to && booking.date_available_from < date_available_from
  #       errors.add(:overlaps, 'Already booked')
  #     end
  #   end
  # end

end
