class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :nom, :string
    add_column :users, :adresse, :string
    add_column :users, :telephone, :integer
  end
end
