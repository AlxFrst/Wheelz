import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    latitude: String,
    longitude: String
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    console.log(this.latitudeValue);
    console.log(this.longitudeValue);
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v11",
    });

    const marker1 = new mapboxgl.Marker()
        .setLngLat([ this.latitudeValue, this.longitudeValue ])
        .addTo(this.map);
    this.#fitMapToMarkers();
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.latitudeValue, this.longitudeValue ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
