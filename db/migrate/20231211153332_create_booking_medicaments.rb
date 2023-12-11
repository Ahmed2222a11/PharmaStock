class CreateBookingMedicaments < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_medicaments do |t|
      t.integer :quantite
      t.references :booking, null: false, foreign_key: true
      t.references :medicament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
