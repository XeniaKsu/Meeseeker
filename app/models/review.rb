class Review < ApplicationRecord
  before_create :has_review?
  belongs_to :booking
  validates :comment, length: { minimum: 20 }

  def has_review?
    Review.exists?(booking_id: booking.id)
  end

end
