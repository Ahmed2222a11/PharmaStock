import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="plus-moins-panier"
export default class extends Controller {
  static values = { stock: Number }

  plus() {
    const quantite = document.querySelector("#booking_medicament_quantite")
    if (parseInt(quantite.value) < this.stockValue) {
      quantite.value = parseInt(quantite.value) + 1
    };
  }

  moins() {
    const quantite = document.querySelector("#booking_medicament_quantite")
    if (parseInt(quantite.value) > 1) {
      quantite.value = parseInt(quantite.value) - 1
    }
  }
}
