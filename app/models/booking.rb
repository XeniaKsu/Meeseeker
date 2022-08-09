class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :meeseek, dependent: :destroy
  validates :task, presence: true
  validate :date_in_past
  validate :validate_other_booking_overlap
  scope :future_reservations, -> { where("date_available_to > ?", Date.today)}
  # Need to add validation around if Meeseeks already booked during that time then not possible to book again.
  #add user to validation

  def date_in_past
    if Date.today > date_available_to || Date.today > date_available_from
      errors.add(:task, "Date can't be in the past")
    end
  end

  # duration_ofstay = date_available_from - date_available_to
  def duration
    date_available_from..date_available_to
  end

  private

  def validate_other_booking_overlap
    other_bookings = Booking.all
    is_overlapping = other_bookings.any? do |other_booking|
      duration.overlaps?(other_booking.duration)
    end
    errors.add(:task, "Someone else has booked during this time") if is_overlapping
  end

end
