class CreatePharmacies < ActiveRecord::Migration[7.1]
  def change
    create_table :pharmacies do |t|
      t.string :adresse
      t.string :nom
      t.string :email
      t.integer :telephone

      t.timestamps
    end
  end
end
