class BookingsController < ApplicationController



def new
  @booking = Booking.new
  @booking.user = current_user
  @pharmacie = Pharmacie.find(params[:pharmacie_id])
  @booking.pharmacie = @pharmacie
  if @booking.save
    @bookmed = BookingMedicament.new(booking: @booking, medicament: Medicament.find_by(nom: params[:medicament]), quantite: params[:quantite].to_i)
    @bookmed.save

  end
end

  def create

    @booking = Booking.new
    @booking.user = current_user
    @booking.pharmacie = Pharmacie.find(params[:booking_medicament][:pharmacie_id]
    )
    if @booking.save

      @bookmed = BookingMedicament.new(booking: @booking, medicament: Medicament.find_by(nom: params[:booking_medicament][:medicament]), quantite: params[:booking_medicament][:quantite].to_i)
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
    @qrcode = RQRCode::QRCode.new("Médicament: #{@booking_medicaments.first.medicament.nom}, Quantité: #{@booking_medicaments.first.quantite}")

  end

  end
