import "bootstrap";
import { initType } from '../components/typed_components'
import { initSweetalert } from '../plugins/init_sweetalert';
import { initMapboxGl } from '../plugins/init_mapbox'
import { initMapbox } from '../plugins/new_mapbox'

initSweetalert('#sweet-alert-demo', {
  title: "A nice alert",
  text: "find me at app/javascript/packs/application.js",
  icon: "success"
});

initType("#convoy-title");

initMapboxGl('#address_form');
initMapbox();
