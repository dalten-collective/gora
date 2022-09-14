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
    setPita(state, payload: PitaState) {
      state.pita = payload;
    },
    //addSubscription(state, payload: AgentSubscription) {
      //state.subscriptions.push(payload);
    //},

    //unsetSubscription(state, subscription: AgentSubscription) {
      //const sub = state.subscriptions.find((s) => s === subscription);
      //state.subscriptions = state.subscriptions.filter((s) => s != sub);
    // },
    applyDiff(state, payload: DiffResponse) {
      state.pita = _.merge(payload.diff.set.pita, state.pita)
    }
  },

  actions: {
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
