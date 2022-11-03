import { Tagged, PublicState, PolicyState, TagsState, DiffResponse, GoraID } from "@/types";

import api from "@/api"

export default {
  namespaced: true,
  state() {
    return {
      haveMeta: false,
      public: [] as PublicState,
      policy: [] as PolicyState,
      tags: [] as TagsState,
    };
  },

  getters: {
    thisGoraTags: (state) => (goraID: GoraID): Array<string> => {
      return state.tags.filter((t: Tagged) => {
        return t['id-list'].includes(goraID)
      })
    },
    thisGoraPub: (state) => (goraID: GoraID): boolean => {
      return state.public.includes(goraID)
    },
  },

  mutations: {
    setPublic(state, payload: PublicState) {
      state.public = payload;
    },
    setPolicy(state, payload: PolicyState) {
      state.policy = payload;
    },
    setTags(state, payload: TagsState) {
      state.tags = payload;
    },
    haveMeta(state) {
      state.haveMeta = true;
    },

    applyDiff(state, payload: DiffResponse) {
      // remove ids from this tag's state
      const tagRems: Array<Tagged> = payload.diff.rem.tags
      tagRems.forEach((tagRem: Tagged) => {
        const thisTag = state.tags.find((existTag: Tagged) => {
          return existTag.tag === tagRem.tag
        })
        if (thisTag) {
          const newList = thisTag['id-list'].filter((id: GoraID) => {
            return !tagRem['id-list'].includes(id)
          })
          thisTag['id-list'] = newList
        }
      })

      // add this tag and/or its IDs
      const tagAdds: Array<Tagged> = payload.diff.set.tags
      tagAdds.forEach((tagAdd) => {
        const thisTag = state.tags.find((existTag: Tagged) => {
          return existTag.tag === tagAdd.tag
        })
        if (thisTag) { // add to existing
          const tagSet = new Set(thisTag['id-list'])
          tagAdd['id-list'].forEach((id: GoraID) => tagSet.add(id))
          thisTag['id-list'] = Array.from(tagSet)
        } else {       // add new
          state.tags.push(tagAdd)
        }
      })

      // remove from public
      state.public = state.public.filter((id) => {
        return !payload.diff.rem.public.includes(id)
      })

      // add to public
      const pubSet = new Set(state.public)
      payload.diff.set.public.forEach(id => pubSet.add(id))
      state.public = Array.from(pubSet)
    },
  },

  actions: {
    haveMeta({ commit }) {
      commit('haveMeta')
    },
    handleDiff({ commit, dispatch }, payload: DiffResponse) {
      commit("applyDiff", payload);
    },

    pokeAddTag({ commit, dispatch }, pokePayload: { tag: string, gorae: Array<GoraID> } ) {
      return api.addTag(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    },

    pokeRemTag({ commit, dispatch }, pokePayload: { tag: string, gorae: Array<GoraID> } ) {
      return api.remTag(pokePayload)
        .then((r) => {
          return r
        })
        .catch((e) => {
          throw e
        })
    },

    pokePubMod(
      { commit, dispatch },
      pokePayload: { id: GoraID; how: boolean }
    ) {
      return api
        .pubMod(pokePayload)
        .then((r) => {
          return r;
        })
        .catch((e) => {
          throw e;
        });
    },


    handleSubscriptionData(
      { commit, dispatch },
      payload: {
        public: PublicState;
        policy: PolicyState;
        tags: TagsState;
      }
    ) {
      commit("setPublic", payload.public);
      commit("setPolicy", payload.policy);
      commit("setTags", payload.tags);
    },
  },
};
