import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initSlick } from '../plugins/init_slick';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initCategorySelector } from '../plugins/select_category';
import { initSortable } from '../plugins/init_sortable';
import { initImages } from '../plugins/init_images'
import { initSize } from '../plugins/init_size'
import { initDisableLocation } from '../plugins/init_disablelocation'
import { initDisable } from '../plugins/init_disable'
import { launchTimer } from '../plugins/init_timer'

initMapbox();
initAutocomplete();
initCategorySelector();
initSortable();
initImages();
initSize();
launchTimer();
initDisable();
initDisableLocation();
