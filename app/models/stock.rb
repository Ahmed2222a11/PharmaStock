class Stock < ApplicationRecord
  belongs_to :medicament
  belongs_to :pharmacie
end
