import {
  GoraIDShip,
  MadeState, PokeAcceptRequest, PokeMkGoraPayload,
  NewBareGora, GoraID
} from "@/types";

import _ from 'lodash'

import api from "@/api"

export default {
  namespaced: true,
  state() {
    return {
      made: [] as MadeState,
      goraeSelected: [] as Array<GoraID>,
    };
  },

  getters: {
    goraIsSelected: (state) => (goraID: GoraID): boolean => {
      return state.goraeSelected.includes(goraID)
    }
  },

  mutations: {
    setMade(state, payload: MadeState) {
      state.made = payload;
    },
    applyDiff(state, payload: DiffResponse) {
      // remove
      state.made = state.made.filter(id => !payload.diff.rem.made.includes(id))
      // add
      state.made = state.made.concat(payload.diff.set.made)
    },

    addGoraToSelected(state, goraID: GoraID) {
      const ids = new Set(state.goraeSelected)
      ids.add(goraID)
      state.goraeSelected = Array.from(ids)
    },
    removeGoraFromSelected(state, goraID: GoraID) {
      state.goraeSelected = state.goraeSelected.filter((gid) => gid !== goraID)
    },
  },

  actions: {
    handleSubscriptionData({ commit, dispatch }, payload: MadeState) {
      console.log('in made ', payload)

      commit('setMade', payload)
    },
    handleDiff({ commit, dispatch }, payload: DiffResponse) {
      commit('applyDiff', payload)
    },

    pokeMkGora({ commit, dispatch }, pokePayload: PokeMkGoraPayload) {
      return api.mkGora(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    },

    pokeStakGora({ commit, dispatch }, pokePayload: { dez: Array<GoraID>, which: GoraID | NewBareGora } ) {
      return api.stakEm(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    },

    pokeGiveGora({ commit, dispatch }, pokePayload: { id: GoraID, who: Array<Ship> }) {
      return api.sendGive(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    },

    pokeAcceptRequest({ commit, dispatch }, pokePayload: GoraIDShip) {
      return api.acceptRequest(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    },

    pokeIgnoreRequest({ commit, dispatch }, pokePayload: GoraIDShip) {
      return api.ignoreRequest(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    },

    selectGora({ commit }, goraID: GoraID) {
      commit('addGoraToSelected', goraID)
    },
    deselectGora({ commit }, goraID: GoraID) {
      commit('removeGoraFromSelected', goraID)
    },

  },
};
