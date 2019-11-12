import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initSlick } from '../plugins/init_slick';
import { initAutocomplete, initAutocomplete1 } from '../plugins/init_autocomplete';
import { initCategorySelector } from '../plugins/select_category';
import { initSortable } from '../plugins/init_sortable';
import { initImages } from '../plugins/init_images';
import '../plugins/init_timer';

initMapbox();
initAutocomplete();
initAutocomplete1();
initCategorySelector();
initSortable();
initImages();
