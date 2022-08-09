class Meeseek < ApplicationRecord
  has_many :bookings
  # has_many :reviews, through: :bookings
   belongs_to :user, dependent: :destroy

   geocoded_by :postcode
   after_validation :geocode, if: :will_save_change_to_postcode?

  # postcode_regex = /[a-z]+\d+[a-z]?\s?\d[a-z]{2}/
  # validates_presence_of :postcode, format: { with: postcode_regex }
  validates_presence_of :postcode
  validates_presence_of :user

  # Shows available dates
  # def available_dates
  #   next_reservation = bookings.where()

  # end
end
