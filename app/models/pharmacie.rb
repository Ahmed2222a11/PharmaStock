class Pharmacie < ApplicationRecord
  has_many :stocks
  has_many :medicaments, through: :stocks
  has_many :bookings
end
