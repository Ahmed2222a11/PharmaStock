class PharmaciesController < ApplicationController
before_action :set_pharmacie, only: [:show]
  def index
    if @veto = params[:veto] == "true"
      session[:veto] = true
    end
    if @veto = params[:veto] == "false"
      session[:veto] = false
    end

    if params[:de_garde] && session[:veto]
      @pharmacie_de_garde = Pharmacie.find_by(veto: true, de_garde: true)

    elsif session[:veto]
      @pharmacies = Pharmacie.where(veto: true)

    elsif params[:de_garde]
      @pharmacie_de_garde = Pharmacie.find_by(de_garde: true)
      # Masquer la barre de recherche dans la vue
      # @hide_search = true


    else
      @pharmacies = Pharmacie.where(veto: false)
      # if params[:medicament] != ""
      #   @pharmacies = Pharmacie.where(["medicament= ?", params[:medicament]])
      # end
      @medicament_1 = ""
      @quantite_1 = ""
    end

    if session[:veto]
      @medicaments = Medicament.where(medoc_veto: true)
    else
      @medicaments = Medicament.where(medoc_veto: false)
    end

    if !params[:nom_de_medicament].nil? && !params[:quantite].nil? && params[:nom_de_medicament_1] != "" && params[:quantite_1] != ""
      @medicament = Medicament.find_by(nom: params[:nom_de_medicament])
      @medicament_1 = Medicament.find_by(nom: params[:nom_de_medicament_1])
      @quantite = params[:quantite]
      @quantite_1 = params[:quantite_1]
      @pharmacies = @pharmacies.joins(:medicaments)
      .joins("INNER JOIN stocks s1 ON pharmacies.id = s1.pharmacie_id AND s1.medicament_id = #{@medicament.id}")
      .joins("INNER JOIN stocks s2 ON pharmacies.id = s2.pharmacie_id AND s2.medicament_id = #{@medicament_1.id}")
      .where("s1.quantite >= ? AND s2.quantite >= ?", @quantite, @quantite_1).distinct
    elsif !params[:nom_de_medicament].nil? && !params[:quantite].nil?
      @pharmacies = @pharmacies.joins(stocks: :medicament).where("medicaments.nom ILIKE ? AND stocks.quantite >= ?", "%#{params[:nom_de_medicament]}%", params[:quantite].to_i )
      @medicament = Medicament.find_by(nom: params[:nom_de_medicament])
      @quantite = params[:quantite]
    end
    if @pharmacies.present?
      @medocs = [@medicament]
      @medocs << @medicament_1 if @medicament_1.present?
      @markers = @pharmacies.geocoded.map do |pharmacie|

          {
          lat: pharmacie.latitude,
          lng: pharmacie.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: {pharmacie: pharmacie, medicament: @medocs}),
          marker_html: render_to_string(partial: "marker", locals: {pharmacie: pharmacie})
        }
      end
    end
    if @pharmacie_de_garde&.geocoded?
      @markers = [{
        lat: @pharmacie_de_garde.latitude,
        lng: @pharmacie_de_garde.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { pharmacie: @pharmacie_de_garde }),
        marker_html: render_to_string(partial: "marker", locals: { pharmacie: @pharmacie_de_garde })
      }]
    end
  end

  def show
    if @pharmacie.de_garde
      # Si la pharmacie est de garde, ne chargez pas les médicaments
      @medicament = nil
      @medicament1 = nil
    else
    @medicament = Medicament.find(params[:medicament_id])
    @quantite = params[:quantite]
      if params[:medicament1].present? && params[:qty1].present?
      @medicament1 = Medicament.find(params[:medicament1])
      @quantite1 = params[:qty1]
      end
    end
  end

  def set_pharmacie_de_garde
    Pharmacie.update_all(de_garde: false)  # Réinitialiser le statut de garde
    Pharmacie.order("RANDOM()").first.update(de_garde: true)
  end

private

def set_pharmacie
  @pharmacie = Pharmacie.find(params[:id])
end

end
