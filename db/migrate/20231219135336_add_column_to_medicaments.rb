class AddColumnToMedicaments < ActiveRecord::Migration[7.1]
  def change
    add_column :medicaments, :medoc_veto, :boolean, default: false
  end
end
