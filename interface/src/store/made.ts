import {
  MadeState, PokeMkGoraPayload,
} from "@/types";

import _ from 'lodash'

import manageAPI from "@/api"

export default {
  namespaced: true,
  state() {
    return {
      made: [] as MadeState,
    };
  },

  getters: {
  },

  mutations: {
    setMade(state, payload: MadeState) {
      state.made = payload;
    },
    applyDiff(state, payload: DiffResponse) {
      // remove
      state.made = state.made.filter(id => !payload.diff.rem.made.includes(id))
      // add
      state.made = state.made.concat(payload.diff.set.made)
    }
  },

  actions: {
    handleSubscriptionData({ commit, dispatch }, payload: MadeState) {
      console.log('in made ', payload)

      commit('setMade', payload)
    },
    handleDiff({ commit, dispatch }, payload: DiffResponse) {
      commit('applyDiff', payload)
    },

    pokeMkGora({ commit, dispatch }, pokePayload: PokeMkGoraPayload) {
      return manageAPI.mkGora(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    }
  },
};
