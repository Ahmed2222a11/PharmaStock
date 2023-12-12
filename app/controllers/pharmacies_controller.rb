class PharmaciesController < ApplicationController
  before_action :set_pharmacie, only: [:show]
    def index
      @pharmacies = Pharmacie.where(user: current_user)
    end

    def show
    end

  private

  # if  params [:query].present?
  #   @pharmacies = @pharmacie.where("medicaments.nom ILIKE ?", "%{prams[:query]}")
  def set_pharmacie
    @pharmacie = Pharmacie.find(params[:id])
  end

  end
