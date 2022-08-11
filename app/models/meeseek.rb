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
  def available_dates
    date_format = "%b %e"
    next_reservation = bookings.future_reservations.order(date_available_to: :desc).first
    return Date.tomorrow.strftime(date_format)..Date.today.end_of_year.strftime(date_format) if next_reservation.nil?
    next_reservation.date_available_to.strftime(date_format)..Date.today.end_of_month.strftime(date_format)
  end

  include PgSearch::Model
  pg_search_scope :search_by_postcode,
    against: [ :postcode ],
    using: {
      tsearch: { prefix: true }
    }

end
