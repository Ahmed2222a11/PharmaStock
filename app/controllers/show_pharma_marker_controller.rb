class ShowPharmaMarkerController < ApplicationController
  def show
    @pharmacie = Pharmacie.find(params[:id])

  end
end
