class ChangeTelephoneTypeInPharmacies < ActiveRecord::Migration[7.1]
  def change
    change_column :pharmacies, :telephone, :string
  end
end
