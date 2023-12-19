import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"
import mapboxgl from 'mapbox-gl' // Don't forget this!
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    session: Boolean,
  }



  connect() {
    Turbo.session.drive = false
    console.log(this.sessionValue);
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

    this.markerOnClick()
    this.focusGeoloc()
  }


  #addMarkersToMap() {

    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
      const color = this.sessionValue ? '#19A7CE' : 'red'
      const markerOptions = {
        color: color,
        id: 'toto'
      };

      new mapboxgl.Marker(markerOptions)
        .setLngLat([marker.lng, marker.lat])

        .setPopup(popup)
        .addTo(this.map)


      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        // .setPopup(popup)
        .addTo(this.map)
        .togglePopup()
      customMarker.innerHTML = marker.marker_html

    })
  }

  markerOnClick() {
    if (window.location.href.includes('nom_de_medicament') || window.location.href.includes('de_garde')) {
      const markers = document.querySelectorAll('.mapboxgl-marker-anchor-center')
      const popups = document.querySelectorAll('.marker-pharmacies')
      markers.forEach((marker) => {
        marker.addEventListener('click', () => {
          popups.forEach((popup) => {
            popup.classList.add('d-none')
          })
        })
      })
      document.addEventListener('click', () => {
        const bigPopup = document.querySelector('.mapboxgl-popup-content')
        if (!bigPopup) {
          popups.forEach((popup) => {
            popup.classList.remove('d-none')
          })
        }
      })
    }
  }

  focusGeoloc() {
    document.querySelector(".btn-geoloc").addEventListener("click", (event) => {
      event.preventDefault()
      const geo = document.querySelector(".mapboxgl-ctrl-geolocate")
      geo.click()
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 40, maxZoom: 15, duration: 0 })
  }

  // disconnect() {
  //   Turbo.session.drive = true
  // }
}
