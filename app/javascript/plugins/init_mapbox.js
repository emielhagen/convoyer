import mapboxgl from 'mapbox-gl';

const initMapboxGl = (selector) => {
  const form = document.querySelector(selector);
  if (form) {
    const mapElement = document.getElementById('map');
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v9',
      center: [133.886053, -23.700846],
      zoom: 3,
      interactive: false
    });
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      const address = document.getElementById('address_input').value;
      fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${apiKey}`)
        .then(response => response.json())
        .then((data) => {
          const coordinates = data.features[0].geometry.coordinates;
          new mapboxgl.Marker()
            .setLngLat([coordinates[0], coordinates[1]])
            .addTo(map);
          map.flyTo({ center: [coordinates[0], coordinates[1]] });
        });
    });
  }
};


export { initMapboxGl };
