class Meeseek < ApplicationRecord
  has_many :bookings
  has_many :reviews, through: :bookings
  belongs_to :user, through: :bookings
  validates_presence_of :location
end
