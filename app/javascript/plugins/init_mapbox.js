import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');
const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    // style: 'mapbox://styles/mapbox/streets-v10'
    style: 'mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb'
  });
};

const addMarkersResponse = (map) => {
  const data = document.querySelectorAll(".card-results-individual");
  data.forEach(clothes => {
    clothes.addEventListener("mouseenter", event => {
      console.log((event.target.dataset.location));
      // console.log((event.target.dataset.location["lat"]));
      const lng = Number(event.target.dataset.location["lng"]);
      const lat = Number(event.target.dataset.location["lat"]);
      console.log(lng);
      map.flyTo({
        center: [lng, lat],
        zoom: 15
      });
    })
  })
}

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '50px';
    element.style.height = '50px';
    new mapboxgl.Marker(element)
      .setPopup(popup)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
};
const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
    addMarkersResponse(map);
  }
};
export { initMapbox };
