import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "field_one", "qty_one"]
  connect() {
  }

  addinput(e) {
    e.preventDefault();
    if (this.field_oneTarget.classList.contains("d-none")) {
    this.field_oneTarget.classList.remove("d-none");
    this.qty_oneTarget.classList.remove("d-none");
    }
  }

  // addinfowindow() {
  //   const infowindow = document.querySelectorAll("mapboxgl-popup-content");
  //   infowindow.forEach((element) => {
  //     element.classList.remove("d-none");
  //   });
  //   console.log(infowindow);
  // }
}
