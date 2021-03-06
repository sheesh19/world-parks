import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
    const mapElement = document.getElementById('map');

    const fitMapToMarkers = (map, markers) => {
        const bounds = new mapboxgl.LngLatBounds();
        markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
        map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 });
    };

    if (mapElement) {
        mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/sheesh19/ckni7watp0btn17pn1pvarcew'
        });

        const markers = JSON.parse(mapElement.dataset.markers);

        markers.forEach((marker) => {
            const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

            const element = document.createElement('div');
            element.className = 'marker';
            element.style.backgroundImage = `url('${marker.image_url}')`;
            element.style.backgroundSize = 'contain';
            element.style.width = '25px';
            element.style.height = '25px';

            new mapboxgl.Marker(element)
                .setLngLat([marker.lng, marker.lat])
                .setPopup(popup)
                .addTo(map);
        });

        fitMapToMarkers(map, markers);
    }
};

export { initMapbox };