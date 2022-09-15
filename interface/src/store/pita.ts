import {
  PitaState,
  Gora,
  GoraID,
  PokeRmGora,
  DiffResponse,
} from "@/types";

import _ from 'lodash'

import manageAPI from '@/api'

export default {
  namespaced: true,
  state() {
    return {
      havePita: false,
      pita: [] as PitaState,
    };
  },

  getters: {
    goraByID: (state) => (goraID: GoraID): Gora => {
      return state.pita.find((g: Gora) => g.id === goraID)
    },
    pitaIDs(state) {
      return state.pita.map(g => g.id);
    },
  },

  mutations: {
    havePita(state) {
      state.havePita = true;
    },
    setPita(state, payload: PitaState) {
      state.pita = payload;
    },
    applyDiff(state, payload: DiffResponse) {
      // remove
      state.pita = state.pita.filter(a => !payload.diff.rem.pita.map(r => r.id).includes(a.id))
      // add
      state.pita = state.pita.concat(payload.diff.set.pita)
    }
  },

  actions: {
    havePita({ commit }) {
      commit("havePita")
    },

    handleSubscriptionData({ commit, dispatch }, payload: PitaState) {
      console.log('in pita ', payload)

      commit('setPita', payload)
    },
    handleDiff({ commit, dispatch }, payload: DiffResponse) {
      commit('applyDiff', payload)
    },

    pokeRmGora({ commit, dispatch }, pokePayload: PokeRmGora) {
      console.log(pokePayload)
      return manageAPI.rmGora(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    },
  },
};
