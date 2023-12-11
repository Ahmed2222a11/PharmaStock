class Medicament < ApplicationRecord
  has_many :pharmacies
  has_many :bookings
end
