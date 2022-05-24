// TO MAKE THE MAP APPEAR YOU MUST
	// ADD YOUR ACCESS TOKEN FROM
	// https://account.mapbox.com
mapboxgl.accessToken = 'pk.eyJ1IjoiYWx4MTEwNyIsImEiOiJjbDJ1OGNiejUwYnJkM3NvNHV5YmJvZnIzIn0.57cUtXHIjKkas4VUYuoD2Q';
const map = new mapboxgl.Map({
container: 'map',
style: 'mapbox://styles/mapbox/streets-v11',
center: [12.550343, 55.665957],
zoom: 8
});

// Create a default Marker and add it to the map.
const marker1 = new mapboxgl.Marker()
.setLngLat([12.554729, 55.70651])
.addTo(map);

// Create a default Marker, colored black, rotated 45 degrees.
const marker2 = new mapboxgl.Marker({ color: 'black', rotation: 45 })
.setLngLat([12.65147, 55.608166])
.addTo(map);
