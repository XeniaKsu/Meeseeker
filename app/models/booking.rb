class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :meeseek, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :task, presence: true
  validates :date_available_from, presence: true
  validates :date_available_to, presence: true
  validate :date_in_past
  validates :date_available_from, :date_available_to, overlap: {
    scope: :meeseek_id,
    message: "Some validation title",
    message_content: "Some validation message"
  }
  # validate :validate_other_booking_overlap, on: :create
  scope :future_reservations, -> { where("date_available_to > ?", Date.today)}
  # Need to add validation around if Meeseeks already booked during that time then not possible to book again.
  #add user to validation

  def date_in_past
    if date_available_from.nil? || date_available_to.nil?
    elsif Date.today > date_available_to || Date.today > date_available_from
      errors.add(:task, "Date can't be in the past")
    end
  end


  # # duration_ofstay = date_available_from - date_available_to
  # def duration
  #   date_available_from..date_available_to
  # end

  # private

  # def validate_other_booking_overlap
  #   other_bookings = Booking.where(meeseek_id: meeseek)
  #     # self.meeseek_id
  #   is_overlapping = other_bookings.any? do |other_booking|
  #     duration.overlaps?(other_booking.duration)
  #   end
  #   errors.add(:task, "Someone else has booked during this time") if is_overlapping
  # end

  # def validate_other_booking_overlap
  #   bookings = Booking.where(params[:meeseek_id])
  #   bookings.each do |booking|
  #     if date_available_from < booking.date_available_to && booking.date_available_from < date_available_to
  #       errors.add(:task, "Someone else has booked during this time")
  #     end
  #   end
  # end

end
