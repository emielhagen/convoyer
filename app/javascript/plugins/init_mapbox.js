import mapboxgl from 'mapbox-gl';

const apiKey = 'pk.eyJ1IjoiZW1pZWxnZW9jb2RlciIsImEiOiJjanZwdmRyeW0waDB5M3ptb2kya3F1bnpjIn0.h7N-hVVmVCTZRTE35T_tFA';
mapboxgl.accessToken = apiKey;

const initMapboxGl = (selector) => {
  const form = document.querySelector(selector);
  if (form) {
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v9',
      center: [-118.2439, 34.0544],
      zoom: 12,
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
