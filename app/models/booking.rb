class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pharmacie
  has_many :booking_medicaments

end
