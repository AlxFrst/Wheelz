import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    latitude: Number,
    longitude: Number
  }

  connect() {
    console.log(this.latitudeValue);
    console.log(this.longitudeValue);
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [this.longitudeValue, this.latitudeValue],
      zoom: 12
    });

    const marker1 = new mapboxgl.Marker()
      .setLngLat([this.longitudeValue, this.latitudeValue])
      .addTo(this.map);
  }
}
