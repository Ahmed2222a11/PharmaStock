class AddVeterinaireToPharmacies < ActiveRecord::Migration[7.1]
  def change
    add_column :pharmacies, :veto, :boolean, default: false
  end
end
