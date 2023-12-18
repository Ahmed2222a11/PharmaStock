class AddDeGardeToPharmacies < ActiveRecord::Migration[7.1]
  def change
    add_column :pharmacies, :de_garde, :boolean
  end
end
