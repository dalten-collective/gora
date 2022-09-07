import { createStore } from "vuex";

import ship from "./ship";
import pita from "./pita";

const store = createStore({
  modules: {
    ship,
    pita,
  },
});

export default store;
