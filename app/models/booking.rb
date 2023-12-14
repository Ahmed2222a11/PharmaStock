class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pharmacie
  has_many :booking_medicaments, dependent: :destroy
  accepts_nested_attributes_for :booking_medicaments
end
