import {
  GoraIDShip,
  MadeState,
  PokeAcceptRequest,
  PokeMkGoraPayload,
  NewBareGora,
  GoraID,
  UrbNull,
  Existing,
  Cult,
} from "@/types";

// import _ from "lodash";

import api from "@/api";
import cultAPI from "@/api";

export default {
  namespaced: true,
  state() {
    return {
      cults: [] as Array<Cult>,
    };
  },

  getters: {
    cultsAroundGora: (state) => (goraID: GoraID): Array<Cult> => {
      return state.cults.filter((cult: Cult) => {
        return cult.key === goraID
      })
    },
  },

  mutations: {
    setCults(state, payload: Array<Cult>) {
      state.cults = payload
    },
    removeCult(state, payload: { key: string; }) {
      state.cults = state.cults.filter((c: Cult) => c.key !== payload.key)
    },
    addCult(state, payload: Cult) {
      if (state.cults.map((c: Cult) => c.key).includes(payload.key)) {
        // Already have it? replace it
        state.cults = state.cults.filter((c: Cult) => c.key !== payload.key)
      }
      // don't have it (maybe we just removed it), push it
      state.cults.push(payload)
    },
  },

  actions: {
    openCultlock(context) {
      cultAPI.openCultlock(
        (data) => {
          if ('set' in data) {
            context.commit('setCults', data.set as Array<Cult>)
          }
          if ('add' in data) {
            context.commit('addCult', data.add)
          }
          if ('del' in data) {
            context.commit('removeCult', data.del)
          }
        },
        (sub) => {
        }
      )
    },

    pokeMkCult(context, payload: { id: GoraID, groupName: string }) {
      return api
        .mkCult(payload)
        .then((r) => {
          return r;
        })
        .catch((e) => {
          throw e;
        });
    },

    pokeRmCult(context, payload: { id: GoraID }) {
      return api
        .rmCult(payload)
        .then((r) => {
          return r;
        })
        .catch((e) => {
          throw e;
        });
    },
  },
};
