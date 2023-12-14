import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="plus-moins-panier"
export default class extends Controller {


  plus() {
    const stock = document.querySelector("#stock").dataset.stock


    const quantite = document.querySelector("#booking_quantite")
    if (parseInt(quantite.value) < stock) {
      quantite.value = parseInt(quantite.value) + 1
    };
  }

  moins() {

    const quantite = document.querySelector("#booking_quantite")
    if (parseInt(quantite.value) > 1) {
      quantite.value = parseInt(quantite.value) - 1
    }
  }

  plus2() {
    const stock2 = document.querySelector("#stock2").dataset.stock2


    const quantite = document.querySelector("#booking_quantite2")
    if (parseInt(quantite.value) < stock2) {
      quantite.value = parseInt(quantite.value) + 1
    };
  }

  moins2() {

    const quantite = document.querySelector("#booking_quantite2")
    if (parseInt(quantite.value) > 1) {
      quantite.value = parseInt(quantite.value) - 1
    }
  }
}
