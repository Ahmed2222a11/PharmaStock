class BookingMedicament < ApplicationRecord
  belongs_to :booking
  belongs_to :medicament
end
