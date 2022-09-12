import { createStore } from "vuex";

import ship from "./ship";
import pita from "./pita";
import owned from "./owned";
import made from "./made";
import meta from "./meta";

const store = createStore({
  modules: {
    ship,
    pita,
    owned,
    made,
    meta,
  },
});

export default store;
