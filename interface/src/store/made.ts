import {
  MadeState,
} from "@/types";

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
  },
};
