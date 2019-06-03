import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, features) => {
  const bounds = new mapboxgl.LngLatBounds();
  features.forEach(({ geometry }) => bounds.extend(geometry.coordinates));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });

  features.forEach((feature) => {
    new mapboxgl.Marker({ color: 'black' })
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
        "properties": {
          "description": "WILL THIS WORK?!"
        },
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
      "line-color": "#E5DE86",
      "line-width": 3
    }
  });
};


const initMapbox = () => {
  const mapElement = document.getElementById('new_map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'new_map',
      interactive: false,
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    map.on('load', function() {
      const convoys = JSON.parse(mapElement.dataset.convoys);
      const convoyt = JSON.parse(mapElement.dataset.convoyId);

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
