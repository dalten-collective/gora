import { GoraID, Outgoing, PokeAcceptGive, Request } from "@/types";

import transactAPI from "@/api"

export default {
  namespaced: true,
  state() {
    return {
      haveLogs: false,
      offers: [] as Array<GoraID>,
      requests: [] as Array<Request>,
      outoing: [] as Array<Outgoing>,
    };
  },

  getters: {
    goraInOffers: (state) => (goraID: GoraID): boolean => {
      return state.offers.includes(goraID)
    },
    // TODO: not an array of IDs. fix includes
    //goraInRequests: (state) => (goraID: GoraID): boolean => {
      //return state.requests.includes(goraID)
    //},
    //
    // TODO: not an array of IDs. fix includes
    //goraInOutgoing: (state) => (goraID: GoraID): boolean => {
      //return state.outgoing.includes(goraID)
    //},
  },

  mutations: {
    setOffers(state, payload: Array<GoraID>) {
      state.offers = payload;
    },
    setRequests(state, payload: Array<Request>) {
      state.requests = payload;
    },
    setOutgoing(state, payload: Array<Outgoing>) {
      state.outgoing = payload;
    },
    haveLogs(state) {
      state.haveLogs = true;
    },
    applyDiff(state, payload: DiffResponse) {
      // remove
      state.offers = state.offers.filter(id => !payload.diff.rem.logs.offers.includes(id))


      // add
      state.offers = state.offers.concat(payload.diff.set.logs.offers)
    }
  },

  actions: {
    haveLogs({ commit }) {
      commit('haveLogs')
    },
    handleDiff({ commit, dispatch }, payload: DiffResponse) {
      commit('applyDiff', payload)
    },

    handleSubscriptionData(
      { commit, dispatch },
      payload: {
        offers: Array<GoraID>;
        outgoing: Array<Request>;
        requests: Array<Outgoing>;
      }
    ) {
      console.log("in logs ", payload);

      commit("setOffers", payload.offers);
      commit("setOutgoing", payload.outgoing);
      commit("setRequests", payload.requests);
    },

    pokeAcceptGive({ commit, dispatch }, pokePayload: { id: GoraID }) {
      return transactAPI.acceptGive(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    },

    pokeIgnoreGive({ commit, dispatch }, pokePayload: { id: GoraID }) {
      return transactAPI.ignoreGive(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    },
  },
};
