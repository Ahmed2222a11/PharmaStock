class PharmaciesController < ApplicationController
before_action :set_pharmacie, only: [:show]
  def index

    # if params[:medicament] != ""
    #   @pharmacies = Pharmacie.where(["medicament= ?", params[:medicament]])
    # end
    if !params[:nom_de_medicament].nil? && !params[:quantite].nil?
    @pharmacies = Pharmacie.joins(stocks: :medicament).where("medicaments.nom ILIKE ? AND stocks.quantite >= ?", "%#{params[:nom_de_medicament]}%", params[:quantite].to_i )
    end
  end

  def show

  end

private

def set_pharmacie
  @pharmacie = Pharmacie.find(params[:id])
end

end
