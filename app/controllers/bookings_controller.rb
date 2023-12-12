class BookingsController < ApplicationController


def new
  @booking = Booking.new
  @booking.user = current_user
  @booking.pharmacie = Pharmacie.find(params[:pharmacie_id])
  if @booking.save
    @bookmed = BookingMedicament.new(booking: @booking, medicament: Medicament.find_by(nom: params[:medicament]), quantite: params[:quantite].to_i)
    @bookmed.save

  end
end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.pharmacie = Pharmacie.find(params[:pharmacie_id])
    if @booking.save
      @bookmed = BookingMedicament.new(booking: @booking, medicament: Medicament.find(params[:medicament_id]), quantite: params[:quantite].to_i)
      if @bookmed.save
      redirect_to booking_path(@booking)
      end
    else
      render :new, status: :unprocessable_entity
  end
end

def show
  @booking = Booking.find(params[:id])
  @booking_medicaments = BookingMedicament.where(booking: @booking)
end

end
