class Pharmacie < ApplicationRecord
  has_many :medicaments
  has_many :bookings
end
