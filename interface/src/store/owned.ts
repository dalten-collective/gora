import {
  OwnedState,
} from "@/types";

export default {
  namespaced: true,
  state() {
    return {
      owned: [] as OwnedState,
    };
  },

  getters: {
  },

  mutations: {
    setOwned(state, payload: OwnedState) {
      state.owned = payload;
    },
    applyDiff(state, payload: DiffResponse) {
      // remove
      state.owned = state.owned.filter(id => !payload.diff.rem.owned.includes(id))
      // add
      state.owned = state.owned.concat(payload.diff.set.owned)
    }
  },

  actions: {
    handleSubscriptionData({ commit, dispatch }, payload: OwnedState) {
      console.log('in owned ', payload)

      commit('setOwned', payload)
    },
    handleDiff({ commit, dispatch }, payload: DiffResponse) {
      commit('applyDiff', payload)
    },
  },
};
