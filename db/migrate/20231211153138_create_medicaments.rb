class CreateMedicaments < ActiveRecord::Migration[7.1]
  def change
    create_table :medicaments do |t|
      t.string :nom

      t.timestamps
    end
  end
end
