import { GoraID, Outgoing, PokeAcceptGive, Request, Ship } from "@/types";

import transactAPI from "@/api";

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
      return state.offers.includes(goraID);
    },
    goraInRequests: (state) => (goraID: GoraID): boolean => {
      // TODO: this wrong
      return false
      //return state.offers.includes(goraID);
    },
    goraInShipsRequests: (state, getters) => (args: { goraID: GoraID, ship: Ship}): boolean => {
      console.log('ship', args.ship)
      console.log('id', args.goraID)
      console.log('req by ship', getters.requestsByShip(args.ship))
      console.log('req by ship', getters.requestsByShip(args.ship).flat().includes(args.goraID))
      return getters.requestsByShip(args.ship).includes(args.goraID);
    },

    outgoingFor: (state) => (goraID: GoraID): Array<Outgoing> => {
      return state.outgoing.filter((o: Outgoing) => {
        return o.id === goraID
      })
    },

    requestsForID: (state) => (goraID: GoraID): Array<Ship> => {
      const setShips: Set<Ship> = new Set(
        state.requests
          .map((r: Request) => {
            if (r["id-list"].includes(goraID)) {
              return r.requester;
            } else {
              return null;
            }
          })
        .filter((s: Ship | null) => s != null)
      );
      return Array.from(setShips);
    },

    requestsByShip: (state) => (ship: Ship): Array<GoraID> => {
      const setIDs: Set<GoraID> = new Set(
        state.requests
          .map((r: Request) => {
            if (r['requester'] === ship) {
              return r['id-list'];
            } else {
              return null;
            }
          })
        .filter((idList: Array<GoraID> | null) => idList != null)
      );
      return Array.from(setIDs).flat()
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
      state.offers = state.offers.filter(
        (id) => !payload.diff.rem.logs.offers.includes(id)
      );
      console.log("req diff ", payload);
      // state.requests = state.requests.filter(id => !payload.diff.rem.logs.offers.includes(id))

      // add
      state.offers = state.offers.concat(payload.diff.set.logs.offers);
      // state.requests = state.requests.concat(payload.diff.set.logs.offers)
    },
  },

  actions: {
    haveLogs({ commit }) {
      commit("haveLogs");
    },
    handleDiff({ commit, dispatch }, payload: DiffResponse) {
      commit("applyDiff", payload);
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
      return transactAPI
        .acceptGive(pokePayload)
        .then((r) => {
          return r;
        })
        .catch((e) => {
          throw e;
        });
    },

    pokeIgnoreGive({ commit, dispatch }, pokePayload: { id: GoraID }) {
      return transactAPI
        .ignoreGive(pokePayload)
        .then((r) => {
          return r;
        })
        .catch((e) => {
          throw e;
        });
    },
  },
};
