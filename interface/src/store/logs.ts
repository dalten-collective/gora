import { GoraID, Outgoing, PokeAcceptGive, Request, Ship, DiffResponse } from "@/types";

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
    // goraInOutgoing: (state) => (goraID: GoraID): boolean => {
    //   return state.offers.includes(goraID);
    // },
    goraInRequests: (state) => (goraID: GoraID): boolean => {
      return state.outgoing.filter((req: {
        act: string;
        id: GoraID;
        status: boolean;
        when: number
      }) => {
        if (
          req.act === 'take' && req.id === goraID
        ) {
          return true
        }
        return false
      }).length > 0
    },

    goraInShipsRequests: (state, getters) => (args: { goraID: GoraID, ship: Ship}): boolean => {
      return getters.requestsByShip(args.ship).includes(args.goraID);
    },

    outgoingFor: (state) => (goraID: GoraID): Array<Outgoing> => {
      return state.outgoing.filter((o: Outgoing) => {
        return o.id === goraID
      })
    },

    outgoingGivesFor: (state) => (goraID: GoraID): Array<Outgoing> => {
      return state.outgoing.filter((o: Outgoing) => {
        return o.id === goraID
      }).filter((o: Outgoing) => o.act === "give")
    },
    outgoingTakesFor: (state) => (goraID: GoraID): Array<Outgoing> => {
      return state.outgoing.filter((o: Outgoing) => {
        return o.id === goraID
      }).filter((o: Outgoing) => o.act === "take")
    },
    outgoingGacksFor: (state) => (goraID: GoraID): Array<Outgoing> => {
      return state.outgoing.filter((o: Outgoing) => {
        return o.id === goraID
      }).filter((o: Outgoing) => o.act === "gack")
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
      // offers
      state.offers = state.offers.filter(
        (id: GoraID) => !payload.diff.rem.logs.offers.includes(id)
      );
      // add
      // offers
      state.offers = state.offers.concat(payload.diff.set.logs.offers);

      //////

      // remove requests
      const remReq: Array<Request> = payload.diff.rem.logs.requests
      remReq.forEach((rdiff: Request) => {
        const req = state.requests.find((r: Request) => {
          return r.requester === rdiff.requester
        })
        if (req) { // have this in state
          // remove old requester from state
          state.requests = state.requests.filter((r: Request) => {
            return r.requester !== rdiff.requester
          })

          // set up new id-list
          let newIDList = req['id-list']
          newIDList = req['id-list'].filter((id: GoraID) => !rdiff['id-list'].includes(id))

          // add new requester (and id-list)
          state.requests.push(
            {
              requester: rdiff.requester,
              'id-list': newIDList
            }
          )
        }
      })

      // add requests
      const setReq: Array<Request> = payload.diff.set.logs.requests
      setReq.forEach((sdiff: Request) => {
        const req = state.requests.find((r: Request) => {
          return r.requester === sdiff.requester
        })
        let newIDList;
        if (req) { // already have in state, get its id-list
          // remove old
          state.requests = state.requests.filter((r: Request) => {
            return r.requester !== sdiff.requester
          })

          // set up new id-list
          newIDList = req['id-list']
          sdiff['id-list'].forEach(id => {
            newIDList.push(id)
          })
        } else { // don't have it in state. use this id-list as the whole list
          newIDList = sdiff['id-list']
        }

        // add new requester (and id-list either fresh or edited)
        state.requests.push(
          {
            requester: sdiff.requester,
            'id-list': newIDList,
          }
        )
      });

      //////

      // remove outgoing
      const remOutgoing: Array<Outgoing> = payload.diff.rem.logs.outgoing
      // match on act+who+id
      remOutgoing.forEach((rout: Outgoing) => {
        const req = state.requests.find((o: Outgoing) => {
          return (
            (o.act === rout.act) &&
            (o.id  === rout.id)  &&
            (o.who === rout.who)
          )
        })
        if (req) {
          state.outgoing = state.filter((r: Outgoing) => r !== req)
        }
      })

      const setOutgoing: Array<Outgoing> = payload.diff.set.logs.outgoing
      state.outgoing = setOutgoing;
      // Diff isn't working / giving back entire state. so not adding individually.
      // setOutgoing.forEach((o: Outgoing) => {
      //   // TODO: okay to just shove all in, right?
      //   state.outgoing.push(o)
      // })
    }
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
