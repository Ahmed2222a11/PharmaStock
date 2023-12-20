class Medicament < ApplicationRecord
  has_many :pharmacies
  has_many :bookings
  has_many :booking_medicaments

end
