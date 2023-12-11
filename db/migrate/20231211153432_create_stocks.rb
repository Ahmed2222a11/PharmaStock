class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.integer :quantite
      t.references :medicament, null: false, foreign_key: true
      t.references :pharmacie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
