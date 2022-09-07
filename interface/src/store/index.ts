import { createStore as createVuexStore } from "vuex";

import ship from "./ship";

export const createStore = () => {
  return createVuexStore({
    modules: {
      ship,
    },
  });
};
