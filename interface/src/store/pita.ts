import {
  GoraSubData,
  Pita
} from "@/types";

export default {
  namespaced: true,
  state() {
    return {
      pita: {},  // TODO: type
    };
  },

  getters: {
    //agentSubscriptions(state): Array<AgentSubscription> | [] {
      //return state.subscriptions
    //},
  },

  mutations: {
    setPita(state, payload: Pita) {
      state.pita = payload;
    },
    //addSubscription(state, payload: AgentSubscription) {
      //state.subscriptions.push(payload);
    //},

    //unsetSubscription(state, subscription: AgentSubscription) {
      //const sub = state.subscriptions.find((s) => s === subscription);
      //state.subscriptions = state.subscriptions.filter((s) => s != sub);
    // },
  },

  actions: {
    handleSubscriptionData({ commit, dispatch }, payload: GoraSubData) {
      console.log('in pita ', payload)

      commit('setPita', payload.pita)
    },
  },
};
