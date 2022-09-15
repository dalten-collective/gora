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
    applyDiff(state, payload: DiffResponse) {
      // remove
      state.owned = state.owned.filter(id => !payload.diff.rem.owned.includes(id))
      // add
      state.owned = state.owned.concat(payload.diff.set.owned)
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
    handleSubscriptionData({ commit, dispatch }, payload: OwnedState) {
      console.log('in owned ', payload)

      commit('setOwned', payload)
    },
    handleDiff({ commit, dispatch }, payload: DiffResponse) {
      commit('applyDiff', payload)
    },
  },
};
