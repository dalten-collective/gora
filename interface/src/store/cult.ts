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
      console.log('keys ', state.cults.map((c: Cult) => { c.key }))
      console.log('payload key ', payload.key)

      if (state.cults.map((c: Cult) => c.key).includes(payload.key)) {
        console.log('found cult with key ', payload.key)
        // Already have it? replace it
        state.cults = state.cults.filter((c: Cult) => c.key !== payload.key)
      }
      console.log('adding cult', payload.key)
      // don't have it (maybe we just removed it), push it
      state.cults.push(payload)
    },
  },

  actions: {
    openCultlock(context) {
      cultAPI.openCultlock(
        (data) => {
          console.log('cult ', data)
          if ('set' in data) {
            console.log('cult setting ', data.set as Array<Cult>)
            context.commit('setCults', data.set as Array<Cult>)
          }
          if ('add' in data) {
            console.log('cult adding ', data.add as Cult)
            context.commit('addCult', data.add)
          }
          if ('del' in data) {
            console.log('cult deling ', data.del as { key: string; })
            context.commit('removeCult', data.del)
          }
        },
        (sub) => {
          console.log('cult sub ', sub)
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
