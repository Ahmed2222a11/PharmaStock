# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Medicament.destroy_all
# puts 'destroying medicaments'
# Stock.destroy_all
# puts 'destroying trees'
# User.destroy_all
# puts 'destroying users'
puts "creation pharmacies"
pharma_1 = Pharmacie.create!(nom: "Pharmacie de la gare", adresse: "1 rue de la gare", telephone: "01 02 03 04 05", email: "lol@gmail.com")
pharma_2 = Pharmacie.create!(nom: "Pharmacie de mer", adresse: "2 rue de la gare", telephone: "01 02 03 04 06", email: "lol2@gmail.com")
pharma_3 = Pharmacie.create!(nom: "Pharmacie de la montagne", adresse: "3 rue de la gare", telephone: "01 02 03 04 07", email: "lol3@gmail.com")
pharma_4 = Pharmacie.create!(nom: "Pharmacie de la plage", adresse: "4 rue de la gare", telephone: "01 02 03 04 08", email: "lol4@gmail.com")
puts "pharmacies created"
puts "creation medicaments"
medicament_1 = Medicament.create!(nom: "Doliprane")
medicament_2 = Medicament.create!(nom: "Aspirine")
medicament_3 = Medicament.create!(nom: "Ibuprofene")
medicament_4 = Medicament.create!(nom: "Paracetamol")
puts "medicaments created"

puts "creation stocks"
stock_1 = Stock.create!(quantite: 10, pharmacie_id: pharma_1.id, medicament_id: medicament_1.id)
stock_2 = Stock.create!(quantite: 5, pharmacie_id: pharma_2.id, medicament_id: medicament_2.id)
stock_3 = Stock.create!(quantite: 7, pharmacie_id: pharma_3.id, medicament_id: medicament_3.id)
stock_4 = Stock.create!(quantite: 6, pharmacie_id: pharma_4.id, medicament_id: medicament_4.id)
puts "stocks created"
