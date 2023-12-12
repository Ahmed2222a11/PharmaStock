# class PharmaciesController < ApplicationController
#   def home
#     @pharmacies = Pharmacie.find

#     if params[:localisation]
#       # raise
#           if params[medicament_id] != "" || params[:pharmacie_id] != ""
#             @trees = Tree.where(["adress= ? and medicament.nom == ? and stock >= ?", params[:localisation],  params[:medicament], params[:stock]])
#             # raise
#           elsif params[:min_size] != "" || params[:max_size] != ""
#             @trees = Tree.where(["adress= ? and taille >= ? and taille <= ?", params[:localisation],  params[:min_size].to_i, params[:max_size].to_i])
#             # raise
#           elsif params[:min_price] != "" || params[:max_price] != "" && params[:min_size] != "" || params[:max_size] != ""
#             @trees = Tree.where(["adress= ? and taille= ? and price= ?", params[:localisation],  params[:min_size].to_i, params[:max_size].to_i], params[:min_price], params[:max_price])
#             # raise
#             # we want to see only available trees
#           elsif  params[:start_date] != "" && params[:end_date] != ""
#             @trees = Tree.where(["address= ? ", params[:localisation]])
#             @trees = @trees.reject do |tree|
#               tree.bookings.any? do |booking|
#                 booking_overlaps?(booking, params[:start_date], params[:end_date])
#               end
#             end
#           else
#             #with only localisation
#             @pharmacies = Pharmacie.where(address: params[:localisation].downcase)
#             #  raise
#           end
#         end
# # The `geocoded` scope filters only pharmacie with coordinates
# @pharmacies = Pharmacie.where(id:@pharmacie.map(&:id))
# @markers = @pharmacies.geocoded.map do |pharmacie|
#   {
#     lat: pharmacie.latitude,
#     lng: pharmacie.longitude
#   }
# end
#   end

#   def show
#     # @pharmacies = pharmacie.find(params[:id])
#   end
# end

# if  params [:query].present?
#   @pharmacies = @pharmacie.where("medicaments.nom ILIKE ?", "%{prams[:query]}")
