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
    //agentSubscriptions(state): Array<AgentSubscription> | [] {
      //return state.subscriptions
    //},
  },

  mutations: {
    setOwned(state, payload: OwnedState) {
      state.owned = payload;
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
    handleSubscriptionData({ commit, dispatch }, payload: OwnedState) {
      console.log('in owned ', payload)

      commit('setOwned', payload)
    },
  },
};
