class AddHorairesToPharmacies < ActiveRecord::Migration[7.1]
  def change
    add_column :pharmacies, :horaires, :string
  end
end
