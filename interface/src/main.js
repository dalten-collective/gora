import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import './index.css';

import { createStore } from "./store";

const app = createApp(App);
const store = createStore(app);

app.use(store);
app.use(router);
app.mount("#app");
