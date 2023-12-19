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

Stock.destroy_all
Pharmacie.destroy_all
Medicament.destroy_all
puts "destroying all"

puts "creation pharmacies"
pharma_1 = Pharmacie.create!(nom: "Pharmacie Gounod", adresse: "32 Av. Georges Clemenceau, 06000 Nice", telephone: "0493880492", email: "lol@gmail.com", horaires: "9h-12h / 13h-18h")
pharma_2 = Pharmacie.create!(nom: "Pharmacie Clemenceau", adresse: "14 Av. Georges Clemenceau, 06000 Nice", telephone: "0493885158", email: "lol2@gmail.com", horaires:"9h-12h / 13h-18h")
pharma_3 = Pharmacie.create!(nom: "Pharmacie Thiers", adresse: "62 Bd Gambetta, 06000 Nice", telephone: "0493889434", email: "lol3@gmail.com", horaires:"9h-12h / 13h-18h")
pharma_4 = Pharmacie.create!(nom: "Pharmacie de Paris", adresse: "60 Av. Jean Médecin, 06000 Nice", telephone: "0493851281", email: "lol4@gmail.com", horaires:"9h-12h / 13h-18h", de_garde: true)
pharma_5 = Pharmacie.create!(nom: "Pharmacie du Parc Impérial", adresse: "76 Bd François Grosso, 06000 Nice", telephone: "0493966728", email: "lol5@gmail.com", horaires:"8h30-12h30 / 14h-19h30")
pharma_6 = Pharmacie.create!(nom: "Pharmacie Rex", adresse: "47 Bd Gambetta, 06000 Nice", telephone: "0493966543", email: "lol6@gmail.com", horaires:"8h30-12h15 / 14h-19h")
pharma_7 = Pharmacie.create!(nom: "Pharmacie Meyerbeer", adresse: "30 Rue de la Buffa, 06000 Nice", telephone: "0493887544", email: "lol7gmail.com", horaires:"8h30-12h30 / 14h-20h")


puts "pharmacies created"
puts "creation medicaments"
medicament_1 = Medicament.create!(nom: "Doliprane")
medicament_2 = Medicament.create!(nom: "Aspirine")
medicament_3 = Medicament.create!(nom: "Ibuprofene")
medicament_4 = Medicament.create!(nom: "Paracetamol")
medicament_5 = Medicament.create!(nom: "Zomigoro")
medicament_6 = Medicament.create!(nom: "Eludrill")
medicament_7 = Medicament.create!(nom: "Dafalgan")
medicament_8 = Medicament.create!(nom: "Efferalgan")
medicament_9 = Medicament.create!(nom: "Advil")
medicament_10 = Medicament.create!(nom: "Nurofen")
medicament_11 = Medicament.create!(nom: "Spasfon")
medicament_12 = Medicament.create!(nom: "Smecta")

puts "medicaments created"

puts "creation stocks"
stock_1 = Stock.create!(quantite: 10, pharmacie_id: pharma_1.id, medicament_id: medicament_1.id)
stock_2 = Stock.create!(quantite: 5, pharmacie_id: pharma_2.id, medicament_id: medicament_1.id)
stock_3 = Stock.create!(quantite: 7, pharmacie_id: pharma_3.id, medicament_id: medicament_1.id)
stock_4 = Stock.create!(quantite: 6, pharmacie_id: pharma_4.id, medicament_id: medicament_1.id)
stock_5 = Stock.create!(quantite: 8, pharmacie_id: pharma_5.id, medicament_id: medicament_1.id)
stock_6 = Stock.create!(quantite: 3, pharmacie_id: pharma_6.id, medicament_id: medicament_1.id)
stock_7 = Stock.create!(quantite: 9, pharmacie_id: pharma_7.id, medicament_id: medicament_1.id)
stock_8 = Stock.create!(quantite: 4, pharmacie_id: pharma_1.id, medicament_id: medicament_2.id)
stock_9 = Stock.create!(quantite: 6, pharmacie_id: pharma_2.id, medicament_id: medicament_3.id)
stock_10 = Stock.create!(quantite: 2, pharmacie_id: pharma_3.id, medicament_id: medicament_4.id)
stock_11 = Stock.create!(quantite: 7, pharmacie_id: pharma_4.id, medicament_id: medicament_11.id)
stock_12 = Stock.create!(quantite: 5, pharmacie_id: pharma_5.id, medicament_id: medicament_12.id)
stock_13 = Stock.create!(quantite: 8, pharmacie_id: pharma_6.id, medicament_id: medicament_9.id)
stock_14 = Stock.create!(quantite: 3, pharmacie_id: pharma_7.id, medicament_id: medicament_7.id)



puts "stocks created"


puts "creation veterinaires"
veto_5 = Pharmacie.create!(nom: "Clinique vétérinaire Gambetta", adresse: "85 Bd Gambetta, 06000 Nice", telephone: "0493971080", email: "lol@gmail.com", horaires: "9h-12h / 13h-18h", veto:true)
veto_6 = Pharmacie.create!(nom: "Clinique vétérinaire Berlioz", adresse: "17 Rue Berlioz, 06000 Nice", telephone: "0493873942", email: "lol@gmail.com", horaires: "9h-12h / 13h-18h", veto:true)
veto_7 = Pharmacie.create!(nom: "Clinique vétérinaire Argos", adresse: "16 Rue Lamartine, 06000 Nice", telephone: "0493859727", email: "lol@gmail.com", horaires: "9h-12h / 13h-18h", veto:true)
veto_8 = Pharmacie.create!(nom: "Clinique vétérinaire de Cimiez", adresse: "4 Bd de Cimiez, 06000 Nice", telephone: "0493850158", email: "lol@gmail.com", horaires: "9h-12h / 13h-18h", veto:true, de_garde: true)
veto_9 = Pharmacie.create!(nom: " Clinique vétérinaire Carlone", adresse: "10 Bd Carlone, 06200 Nice", telephone: "0493442121", email: "lol@gmail.com", horaires: "9h-12h / 13h-18h", veto:true)
veto_10 = Pharmacie.create!(nom: "Clinique vétérinaire NiceVet ", adresse: "16 bis Rue Penchienatti, 06000 Nice", telephone: "0493854376", email: "lol@gmail.com", horaires: "9h-12h / 13h-18h", veto:true)
veto_11 = Pharmacie.create!(nom: "Clinique vétérinaire Univet Nice Gorbella", adresse: "11 Bd Gorbella, 06100 Nice", telephone: "0493848793", email: "lol@gmail.com", horaires: "9h-12h / 13h-18h", veto:true)

puts "veterinaires created"


puts "creation medicaments veterinaires"
medicament_13 = Medicament.create!(nom: "Fortekor")
medicament_14 = Medicament.create!(nom: "Emeprid")
medicament_15 = Medicament.create!(nom: "Semintra")
medicament_16 = Medicament.create!(nom: "Pangram")
medicament_17 = Medicament.create!(nom: "Vetmedin")
medicament_18 = Medicament.create!(nom: "Vetoryl")
medicament_19 = Medicament.create!(nom: "Cortavance")
medicament_20 = Medicament.create!(nom: "Cortisyl")
medicament_21 = Medicament.create!(nom: "Frontline")
medicament_22 = Medicament.create!(nom: "Advantix")
medicament_23 = Medicament.create!(nom: "Milbemax")
medicament_24 = Medicament.create!(nom: "Drontal")

puts "medicaments created"


puts "creation stocks veterinaires"
stock_15 = Stock.create!(quantite: 8, medicament_id: medicament_14.id, pharmacie_id: veto_5.id)
stock_16 = Stock.create!(quantite: 3, medicament_id: medicament_14.id, pharmacie_id: veto_5.id)
stock_17 = Stock.create!(quantite: 9, medicament_id: medicament_14.id, pharmacie_id: veto_7.id)
stock_18 = Stock.create!(quantite: 4, medicament_id: medicament_14.id, pharmacie_id: veto_8.id)
stock_19 = Stock.create!(quantite: 6, medicament_id: medicament_14.id, pharmacie_id: veto_9.id)
stock_20 = Stock.create!(quantite: 2, medicament_id: medicament_14.id, pharmacie_id: veto_10.id)
stock_21 = Stock.create!(quantite: 7, medicament_id: medicament_14.id, pharmacie_id: veto_11.id)
stock_22 = Stock.create!(quantite: 5, medicament_id: medicament_13.id, pharmacie_id: veto_5.id)
stock_23 = Stock.create!(quantite: 8, medicament_id: medicament_15.id, pharmacie_id: veto_6.id)
stock_24 = Stock.create!(quantite: 3, medicament_id: medicament_16.id, pharmacie_id: veto_7.id)
stock_25 = Stock.create!(quantite: 9, medicament_id: medicament_17.id, pharmacie_id: veto_8.id)
stock_26 = Stock.create!(quantite: 4, medicament_id: medicament_18.id, pharmacie_id: veto_9.id)
stock_27 = Stock.create!(quantite: 6, medicament_id: medicament_19.id, pharmacie_id: veto_10.id)
stock_28 = Stock.create!(quantite: 2, medicament_id: medicament_20.id, pharmacie_id: veto_11.id)
puts "stocks created"
