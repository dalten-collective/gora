import { Tagged, PublicState, PolicyState, TagsState, DiffResponse, GoraID } from "@/types";

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
      tagRems.forEach((tagRem) => {
        const thisTag = state.tags.find((existTag: Tagged) => {
          existTag.tag === tagRem.tag
        })
        if (thisTag) {
          thisTag['id-list'] = thisTag['id-list'].filter((t: Tagged) => {
            thisTag.tag !== t.tag
          })
        }
      })

      // add this tag and/or its IDs
      const tagAdds: Array<Tagged> = payload.diff.set.tags
      tagAdds.forEach((tagAdd) => {
        const thisTag = state.tags.find((existTag: Tagged) => {
          return existTag.tag === tagAdd.tag
        })
        if (thisTag) { // add to existing
          console.log('found ', thisTag)
          const tagSet = new Set(thisTag['id-list'])
          console.log('prev id list ', tagSet)
          tagAdd['id-list'].forEach((id: GoraID) => tagSet.add(id))
          thisTag['id-list'] = Array.from(tagSet)
          console.log('new id list ', Array.from(tagSet))
        } else {       // add new
          console.log('new tag: ', tagAdd)
          state.tags.push(tagAdd)
        }
      })
    },
  },

  actions: {
    haveMeta({ commit }) {
      commit('haveMeta')
    },
    handleDiff({ commit, dispatch }, payload: DiffResponse) {
      commit("applyDiff", payload);
    },

    handleSubscriptionData(
      { commit, dispatch },
      payload: {
        public: PublicState;
        policy: PolicyState;
        tags: TagsState;
      }
    ) {
      console.log("in meta ", payload);

      commit("setPublic", payload.public);
      commit("setPolicy", payload.policy);
      commit("setTags", payload.tags);
    },
  },
};
