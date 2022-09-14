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
    //agentSubscriptions(state): Array<AgentSubscription> | [] {
      //return state.subscriptions
    //},
  },

  mutations: {
    setMade(state, payload: MadeState) {
      state.made = payload;
    },
    applyDiff(state, payload: DiffResponse) {
      console.log('made diff ', payload.diff)
      console.log('merge ',_.merge(payload.diff.set.made, state.made))
      state.made = _.merge(payload.diff.set.made, state.made)
      console.log('made state ', state.made)
    }
    //addSubscription(state, payload: AgentSubscription) {
      //state.subscriptions.push(payload);
    //},

    //unsetSubscription(state, subscription: AgentSubscription) {
      //const sub = state.subscriptions.find((s) => s === subscription);
      //state.subscriptions = state.subscriptions.filter((s) => s != sub);
    // },
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
