class PharmaciesController < ApplicationController
before_action :set_pharmacie, only: [:show]
  def index
    @pharmacies = Pharmacie.all
    # if params[:medicament] != ""
    #   @pharmacies = Pharmacie.where(["medicament= ?", params[:medicament]])
    # end
    @medicament_1 = ""
    @quantite_1 = ""

    if !params[:nom_de_medicament].nil? && !params[:quantite].nil? && params[:nom_de_medicament_1] != "" && params[:quantite_1] != ""
      @medicament = Medicament.find_by(nom: params[:nom_de_medicament])
      @medicament_1 = Medicament.find_by(nom: params[:nom_de_medicament_1])
      @quantite = params[:quantite]
      @quantite_1 = params[:quantite_1]
      @pharmacies = Pharmacie.joins(:medicaments)
      .joins("INNER JOIN stocks s1 ON pharmacies.id = s1.pharmacie_id AND s1.medicament_id = #{@medicament.id}")
      .joins("INNER JOIN stocks s2 ON pharmacies.id = s2.pharmacie_id AND s2.medicament_id = #{@medicament_1.id}")
      .where("s1.quantite >= ? AND s2.quantite >= ?", @quantite, @quantite_1).distinct
    elsif !params[:nom_de_medicament].nil? && !params[:quantite].nil?
      @pharmacies = Pharmacie.joins(stocks: :medicament).where("medicaments.nom ILIKE ? AND stocks.quantite >= ?", "%#{params[:nom_de_medicament]}%", params[:quantite].to_i )
      @medicament = params[:nom_de_medicament]
      @quantite = params[:quantite]
    end
    if @pharmacies
      @markers = @pharmacies.geocoded.map do |pharmacie|
        {
          lat: pharmacie.latitude,
          lng: pharmacie.longitude
        }
      end
    end
  end

  def show

    @medicament = Medicament.find(params[:medicament_id])
    @quantite = params[:quantite]
    @medicament1 = Medicament.find(params[:medicament1])
    @quantite1 = params[:qty1]

  end

private

def set_pharmacie
  @pharmacie = Pharmacie.find(params[:id])
end

end
