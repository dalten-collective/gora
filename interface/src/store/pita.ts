import {
  PitaState,
  Gora,
  GoraID,
} from "@/types";

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
  },

  actions: {
    handleSubscriptionData({ commit, dispatch }, payload: PitaState) {
      console.log('in pita ', payload)

      commit('setPita', payload)
    },
  },
};
