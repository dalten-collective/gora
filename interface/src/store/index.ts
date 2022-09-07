import { createStore } from "vuex";

import ship from "./ship";

const store = createStore({
  modules: {
    ship,
  },
});

export default store;
