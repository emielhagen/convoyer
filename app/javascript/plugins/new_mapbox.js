import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from 'mapbox-gl';

const apiKey = 'pk.eyJ1IjoiZW1pZWxnZW9jb2RlciIsImEiOiJjanZwdmRyeW0waDB5M3ptb2kya3F1bnpjIn0.h7N-hVVmVCTZRTE35T_tFA';

const fitMapToMarkers = (map, features) => {
  const bounds = new mapboxgl.LngLatBounds();
  features.forEach(({ geometry }) => bounds.extend(geometry.coordinates));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });

  features.forEach((feature) => {
    new mapboxgl.Marker()
    .setLngLat([feature.geometry.coordinates[0], feature.geometry.coordinates[1]])
    .addTo(map);
  });
};

const addLineToMap = (map, features) => {
  const line = []
  features.forEach((feature) => {
    line.push(feature.geometry.coordinates)
  });
  map.addLayer({
    "id": "route",
    "type": "line",
    "source": {
      "type": "geojson",
      "data": {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "LineString",
          "coordinates": line
        }
      }
    },
    "layout": {
      "line-join": "round",
      "line-cap": "round"
    },
    "paint": {
      "line-color": "#888",
      "line-width": 8
    }
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('new_map');

  if (mapElement) {
    // mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    mapboxgl.accessToken = apiKey;
    const map = new mapboxgl.Map({
      container: 'new_map',
      interactive: false,
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    map.on('load', function() {
      const convoys = JSON.parse(mapElement.dataset.convoys);
      map.addSource('convoys', {
        type: 'geojson',
        data: convoys,
        cluster: true,
        clusterMaxZoom: 14,
        clusterRadius: 50
      });
      fitMapToMarkers(map, convoys.features);
      addLineToMap(map, convoys.features);
    });
  }
};

export { initMapbox };
