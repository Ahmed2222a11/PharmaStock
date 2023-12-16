import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }



  connect() {
    console.log(this.markersValue);
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);
      const customMarker = document.createElement("div");

      const markerOptions = {
        color: 'red'
      };

      const mapboxMarker = new mapboxgl.Marker(markerOptions)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);

      const customMarkerInstance = new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);

      if (window.location.href.includes("nom_de_medicament")) {
        customMarkerInstance.togglePopup();
      } else {
        customMarkerInstance.togglePopup();
        customMarker.innerHTML = marker.marker_html;
      }

      // Ajouter la classe pour la transition
      setTimeout(() => {
        popup.getElement().classList.add('popup-fade-in');
      }, 0);

      // Ajouter un événement pour supprimer la classe après l'animation
      popup.on('close', () => {
        popup.getElement().classList.remove('show');
      });

      // Ajouter un événement pour ajouter la classe lors de l'ouverture
      popup.on('open', () => {
        popup.getElement().classList.add('show');
      });
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


}
