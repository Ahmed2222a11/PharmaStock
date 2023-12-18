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
      style: "mapbox://styles/mapbox/streets-v10",
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    // Add geolocate control to the map.
    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        // When active the map will receive updates to the device's location as it changes.
        trackUserLocation: true,
        // Draw an arrow next to the location dot to indicate which direction the device is heading.
        showUserHeading: true
      })
      );
      this.#infoMarkers()

  }


  #addMarkersToMap() {

    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")

      const markerOptions = {
        color: 'red'
      };

      new mapboxgl.Marker(markerOptions)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)

      if (window.location.href.includes("nom_de_medicament")) {
        new mapboxgl.Marker(customMarker)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(this.map)
          .togglePopup()
      } else if (window.location.href.includes("de_garde")) {
        new mapboxgl.Marker(customMarker)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(this.map)
          .togglePopup()
      } else {
        new mapboxgl.Marker(customMarker)
          .setLngLat([marker.lng, marker.lat])
          .addTo(this.map)
          .togglePopup()
        customMarker.innerHTML = marker.marker_html
      }
    })
  }



  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 40, maxZoom: 15, duration: 0 })
  }
}
