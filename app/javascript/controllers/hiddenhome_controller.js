import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hiddenhome"
export default class extends Controller {
  connect() {
    console.log("Hello, hiddenhome!");
    this.titleHome()
  }


  titleHome() {
    const hiddenHome = document.querySelector('.hidden-home')
    const titleHome = document.querySelector('.criterion')
    setTimeout(function () {
      hiddenHome.classList.remove('hidden-home');
      hiddenHome.classList.add('visible-home');
      titleHome.classList.add('d-none');
    }, 4000);
  }
}
