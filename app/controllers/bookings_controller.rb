class BookingsController < ApplicationController


  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
      @quantite = params[:quantite]
      @booking = Booking.new
      @booking.user = current_user
      @pharmacie = Pharmacie.find(params[:pharmacie_id])
      @booking.pharmacie = @pharmacie
      @bookmed = BookingMedicament.new(booking: @booking, medicament: Medicament.find_by(nom: params[:medicament]), quantite: params[:quantite].to_i)
  end

def create
  # Crée une nouvelle réservation liée à l'utilisateur actuel
  @booking = Booking.new
  @booking.user = current_user

  # Associe la pharmacie à la réservation en utilisant l'ID de la pharmacie fourni dans le formulaire
  @booking.pharmacie = Pharmacie.find(params[:booking_medicament][:pharmacie_id])

  if @booking.save
    # Crée un nouvel enregistrement BookingMedicament lié à la réservation et au médicament spécifié
    @bookmed = BookingMedicament.new(booking: @booking, medicament: Medicament.find_by(nom: params[:booking_medicament][:medicament]), quantite: params[:booking_medicament][:quantite].to_i)

    if @bookmed.save
      # Recherche ou crée une nouvelle entrée Stock associée à la pharmacie et au médicament de la réservation
      @pharmacie_stock = Stock.find_or_create_by(pharmacie: @booking.pharmacie, medicament: @bookmed.medicament)

      # Calcule la nouvelle quantité en stock après la réservation
      new_quantite = @pharmacie_stock.quantite - @bookmed.quantite

      # Met à jour la quantité en stock
      @pharmacie_stock.update(quantite: new_quantite)

      # Redirige vers la page de la réservation nouvellement créée
      redirect_to booking_path(@booking)
    end
  else
    # Rend le formulaire de création de réservation avec des erreurs s'il y a des problèmes lors de la sauvegarde
    render :new, status: :unprocessable_entity
  end
end

def show
  # Récupère la réservation et les médicaments associés pour l'affichage
  @booking = Booking.find(params[:id])
  @booking_medicaments = BookingMedicament.where(booking: @booking)

  # Génère un QR code basé sur le nom du médicament et la quantité réservée
  @qrcode = RQRCode::QRCode.new("Médicament: #{@booking_medicaments.first.medicament.nom}, Quantité: #{@booking_medicaments.first.quantite}")
end

def destroy
  # Récupère la réservation et la pharmacie associée
  @booking = Booking.find(params[:id])
  @pharmacie = @booking.pharmacie

  # Pour chaque médicament réservé dans la réservation, met à jour le stock correspondant
  @booking.booking_medicaments.each do |booking_medicament|
    medicament = booking_medicament.medicament
    quantite_reservee = booking_medicament.quantite

    # Recherche le stock correspondant à la pharmacie et au médicament
    stock = Stock.find_by(pharmacie: @pharmacie, medicament: medicament)

    if stock
      # Incrémente le stock de la quantité réservée
      stock.update(quantite: stock.quantite + quantite_reservee)
    end
  end

  if @booking.destroy
    # Redirige vers la liste des réservations après suppression
    redirect_to bookings_path, status: :see_other
  else
    # Gère le cas où la suppression échoue
    flash[:alert] = "La suppression de la réservation a échoué."
    redirect_to booking_path(@booking)
  end
end

end
