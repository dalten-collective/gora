import {
  OwnedState,
} from "@/types";

import transactAPI from "@/api"

export default {
  namespaced: true,
  state() {
    return {
      owned: [] as OwnedState,
    };
  },

  getters: {
    goraNotOwned: (state) => (goraID: GoraID): Gora => {
      const owned = state.owned.includes(goraID)
      return !owned
    },
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

    pokeSendPlea({}, pokePayload: { id: GoraID, host: Ship }) {
      return transactAPI.sendPlea(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    },
  },
};
