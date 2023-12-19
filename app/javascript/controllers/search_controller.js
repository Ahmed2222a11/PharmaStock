import { Controller } from "@hotwired/stimulus"
import "select2"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "field_one"]

  addinput(e) {
    e.preventDefault();
    if (this.field_oneTarget.classList.contains("d-none")) {
      this.field_oneTarget.classList.remove("d-none");
    }
  }
  initialize() {
    $('.input-medicaments-search-bar').select2();
  }

}
