import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hidden-text"
export default class extends Controller {
  static targets = ["display"]
  connect() {
  }
  toggleText(){
    console.log(this.displayTarget);
    // this.displayTarget.textContent =
    this.displayTarget.classList.toggle("hidden");
    // `Horaires: ${this.Pharmacie.horaires.value}`

  }
}
