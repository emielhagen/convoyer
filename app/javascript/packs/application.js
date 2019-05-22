import "bootstrap";
import typed from '../components/typed_components'
import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#sweet-alert-demo', {
  title: "A nice alert",
  text: "find me at app/javascript/packs/application.js",
  icon: "success"
});



