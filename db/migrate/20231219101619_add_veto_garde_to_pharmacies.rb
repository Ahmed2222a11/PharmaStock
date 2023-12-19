class AddVetoGardeToPharmacies < ActiveRecord::Migration[7.1]
  def change
    add_column :pharmacies, :veto_garde, :boolean, default: false
  end
end
