class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :meeseek, dependent: :destroy
  validates_presence_of :user, :meeseek, :task
  # Need to add validation around if Meeseeks already booked during that time then not possible to book again.
end