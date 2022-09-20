import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import "./index.css";
import store from "./store";
import vuetify from "./plugins/vuetify";
import { loadFonts } from "./plugins/webfontloader";

import ImageButton from "./components/image-button.vue";

loadFonts();

const app = createApp(App);

app.component("ImageButton", ImageButton);

app.config.globalProperties.ourShip = window.ship;
app.config.globalProperties.$filters = {
  sigShip(ship) {
    if (ship[0] === "~") {
      return ship;
    }
    return `~${ship}`;
  },
  sectToDate(sects) {
    // for taking Urbit's sect:enjs:format and converting to js-friendly
    return new Date(sects * 1000);
  },

};

app.use(router).use(store).use(vuetify).mount("#app");
